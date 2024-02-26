require "test_helper"

class Api::V1::PasswordResetControllerTest < ActionDispatch::IntegrationTest
  def setup
    @active_user = users(:john)
    @non_active_user = users(:john_non_active)
    @invalid_email = "invalid@example.com"
  end

  test 'should create password reset' do
    assert_nil @active_user.reset_digest
    post api_v1_password_resets_url, params: { password_reset: { email: @active_user.email } }
    assert_response :success
    @active_user.reload
    assert_not_nil @active_user.reset_digest
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_equal 'Email sent with password reset instructions', response.parsed_body['message']
  end

  test 'should not create password reset' do
    post api_v1_password_resets_url, params: { password_reset: { email: @invalid_email,
      password: 'password', password_confirmation: 'password' } }
    assert_response :unprocessable_entity
    assert_equal 'Invalid email address', response.parsed_body['errors']
  end

  test 'should not create pasword reset for non activated user' do
    post api_v1_password_resets_url, params: { password_reset: { email: @non_active_user.email } }
    assert_response :unprocessable_entity
    @non_active_user.reload
    assert_nil @non_active_user.reset_digest
    assert_equal 'Account not activated, please check your email for the activation link',
      response.parsed_body['errors']
  end

  test 'should update password reset' do
    assert_nil @active_user.reset_digest
    post api_v1_password_resets_url, params: { password_reset: { email: @active_user.email } }
    assert_response :success
    assert_equal 1, ActionMailer::Base.deliveries.size
    # Get the last email sent
    mail = ActionMailer::Base.deliveries.last
    # Get the HTML part of the email
    html_part = mail.body.parts.find { |part| part.content_type.start_with?('text/html') }
    # Get the body of the HTML part as a string
    body = html_part.body.to_s
    # puts "body response: #{body}"
    token = body[/This is your token <b>(\d+)<\/b>/, 1]
    # Send a PATCH request to update the password reset
    patch api_v1_password_reset_url(token),
      params: { password_reset: { email: @active_user.email,
        password: "passwords", password_confirmation: "passwords" } }
    assert_response :success
    assert_equal 'Password has been reset', response.parsed_body['message']
    @active_user.reload
    assert_nil @active_user.reset_digest
  end

  test 'should not update password reset for expired link' do
    assert_nil @active_user.reset_digest
    post api_v1_password_resets_url, params: { password_reset: { email: @active_user.email } }
    assert_response :success
    assert_equal 1, ActionMailer::Base.deliveries.size
    mail = ActionMailer::Base.deliveries.last
    html_part = mail.body.parts.find { |part| part.content_type.start_with?('text/html') }
    body = html_part.body.to_s
    token = body[/This is your token <b>(\d+)<\/b>/, 1]
    # Update the reset sent time to 3 hours ago
    @active_user.update_attribute(:reset_sent_at, 3.hours.ago)
    # Send a PATCH request to update the password reset
    patch api_v1_password_reset_url(token),
      params: { password_reset: { email: @active_user.email,
        password: "passwords", password_confirmation: "passwords" } }
    assert_response :unprocessable_entity
    assert_equal 'Password reset has expired', response.parsed_body['errors']
    @active_user.reload
    assert_not_nil @active_user.reset_digest
  end

end

require "test_helper"

class SourcesControllerTest < ActionDispatch::IntegrationTest
  def setup
    post auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create source information' do
    assert_difference 'Source.count' do
      post sources_path, params: { source: {
        sumber_informasi: 'radio', jumlah_n: 3, motivasi: 'pendidikan'
      } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
    assert_not_nil Source.find_by_sumber_informasi 'radio'
    assert_not_nil Source.find_by_jumlah_n 3
    assert_not_nil Source.find_by_motivasi 'pendidikan'
  end

  test 'should update source information' do
    post auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    patch source_path(sources(:one)), params: { source: {
      sumber_informasi: 'facebook', jumlah_n: 3, motivasi: 'pendidikan'
    } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    assert_equal 'facebook', sources(:one).reload.sumber_informasi
    assert_equal 3, sources(:one).reload.jumlah_n
    assert_equal 'pendidikan', sources(:one).reload.motivasi
  end

  test 'should show source information' do
    post auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    get personal_url(sources(:one)), headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

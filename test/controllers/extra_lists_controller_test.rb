require "test_helper"

class ExtraListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create extra list' do
    assert_difference 'ExtraList.count' do
      post extra_lists_url, params: {
        extra_list:{
          predikat: 'sangat baik'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update extra list' do
    patch extra_list_url(extra_lists(:one)),
          params: {extra_list: {
            predikat: 'sempurna' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    extra_lists(:one).reload
    assert_equal 'sempurna', extra_lists(:one).predikat
  end

  test 'should show extra list' do
    get extra_list_url(extra_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

require "test_helper"

class BatchListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create batch list' do
    assert_difference 'BatchList.count' do
      post api_v1_batch_lists_url, params: {
        batch_list:{
          gelombang: 'PMDK Sumut 3',
          aktif: false
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update batch list' do
    patch api_v1_batch_list_url(batch_lists(:one)),
          params: {batch_list: {
            gelombang: 'USM III', aktif: true }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    batch_lists(:one).reload
    assert_equal 'USM III', batch_lists(:one).gelombang
    assert_equal true, batch_lists(:one).aktif
  end

  test 'should show province list' do
    get api_v1_batch_list_url(batch_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

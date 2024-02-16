require "test_helper"

class ParentJobListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:admin_michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should show all parent job list' do
    get api_v1_parent_job_lists_url, as: :json
    assert_response :success
  end

  test 'should create parent job list' do
    assert_difference 'ParentJobList.count' do
      post api_v1_parent_job_lists_url, params: {
        parent_job_list:{
          pekerjaan: 'Petani'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update parent job list' do
    patch api_v1_parent_job_list_url(parent_job_lists(:one)),
          params: {parent_job_list: {
            pekerjaan: 'Guru SD' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    parent_job_lists(:one).reload
    assert_equal 'Guru SD', parent_job_lists(:one).pekerjaan
  end

  test 'should show parent job list' do
    get  api_v1_parent_job_list_url(parent_job_lists(:one)),
         headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end

  test 'should delete parent job list' do
    assert_difference 'ParentJobList.count', -1 do
      delete api_v1_parent_job_list_url(parent_job_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
      assert_response :success
    end
  end
end

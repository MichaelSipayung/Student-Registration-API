require "test_helper"

class ParentJobListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create parent job list' do
    assert_difference 'ParentJobList.count' do
      post parent_job_lists_url, params: {
        parent_job_list:{
          pekerjaan: 'Petani'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update parent job list' do
    patch parent_job_list_url(parent_job_lists(:one)),
          params: {parent_job_list: {
            pekerjaan: 'Guru SD' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    parent_job_lists(:one).reload
    assert_equal 'Guru SD', parent_job_lists(:one).pekerjaan
  end

  test 'should show parent education list' do
    get  parent_job_list_url(parent_job_lists(:one)),
         headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

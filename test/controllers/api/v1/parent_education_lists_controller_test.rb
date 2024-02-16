require "test_helper"

class ParentEducationListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:admin_michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should show all parent education list' do
    get api_v1_parent_education_lists_url, as: :json
    assert_response :success
  end

  test 'should create parent education list' do
    assert_difference 'ParentEducationList.count' do
      post api_v1_parent_education_lists_url, params: {
        parent_education_list:{
          pendidikan: 'SLTA'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update parent education list' do
    patch api_v1_parent_education_list_url(parent_education_lists(:one)),
          params: {parent_education_list: {
            pendidikan: 'SMA' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    parent_education_lists(:one).reload
    assert_equal 'SMA', parent_education_lists(:one).pendidikan
  end

  test 'should show parent education list' do
    get api_v1_parent_education_list_url(parent_education_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end

  test 'should destroy parent education list' do
    assert_difference 'ParentEducationList.count', -1 do
      delete api_v1_parent_education_list_url(parent_education_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
      assert_response :success
    end
  end
end

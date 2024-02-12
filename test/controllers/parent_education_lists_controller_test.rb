require "test_helper"

class ParentEducationListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create parent education list' do
    assert_difference 'ParentEducationList.count' do
      post parent_education_lists_url, params: {
        parent_education_list:{
          pendidikan: 'SLTA'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update parent education list' do
    patch parent_education_list_url(parent_education_lists(:one)),
          params: {parent_education_list: {
            pendidikan: 'SMA' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    parent_education_lists(:one).reload
    assert_equal 'SMA', parent_education_lists(:one).pendidikan
  end

  test 'should show parent education list' do
    get  parent_education_list_url(parent_education_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

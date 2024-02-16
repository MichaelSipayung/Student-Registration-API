require "test_helper"

class PersonalReligionListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:admin_michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should show all religion list' do
    get api_v1_personal_religion_lists_url, as: :json
    assert_response :success
  end

  test 'should create personal religion list' do
    assert_difference 'PersonalReligionList.count' do
      post api_v1_personal_religion_lists_url, params: {
        personal_religion_list:{
          agama: 'Muslim'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update personal religion list' do
    patch api_v1_personal_religion_list_url(personal_religion_lists(:one)),
          params: {personal_religion_list: {
            agama: 'Katolik' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    personal_religion_lists(:one).reload
    assert_equal 'Katolik', personal_religion_lists(:one).agama
  end

  test 'should show personal religion list' do
    get api_v1_personal_religion_list_url(personal_religion_lists(:one)),
         headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end

  test 'should destroy personal religion list' do
    assert_difference 'PersonalReligionList.count', -1 do
      delete api_v1_personal_religion_list_url(personal_religion_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
      assert_response :success
    end
  end
end

require "test_helper"

class PersonalReligionListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create personal religion list' do
    assert_difference 'PersonalReligionList.count' do
      post personal_religion_lists_url, params: {
        personal_religion_list:{
          agama: 'Muslim'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update personal religion list' do
    patch personal_religion_list_url(personal_religion_lists(:one)),
          params: {personal_religion_list: {
            agama: 'Katolik' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    personal_religion_lists(:one).reload
    assert_equal 'Katolik', personal_religion_lists(:one).agama
  end

  test 'should show personal religion list' do
    get personal_religion_list_url(personal_religion_lists(:one)),
         headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

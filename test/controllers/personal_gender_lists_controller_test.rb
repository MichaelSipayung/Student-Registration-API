require "test_helper"

class PersonalGenderListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create personal gender list' do
    assert_difference 'PersonalGenderList.count' do
      post personal_gender_lists_url, params: {
        personal_gender_list:{
          jenis_kelamin: 'Pria'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update personal gender list' do
    patch personal_gender_list_url(personal_gender_lists(:one)),
          params: {personal_gender_list: {
            jenis_kelamin: 'Wanita' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    personal_gender_lists(:one).reload
    assert_equal 'Wanita', personal_gender_lists(:one).jenis_kelamin
  end

  test 'should show personal gender list' do
    get  personal_gender_list_url(personal_gender_lists(:one)),
         headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

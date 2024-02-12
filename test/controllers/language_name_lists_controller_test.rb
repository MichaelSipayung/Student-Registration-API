require "test_helper"

class LanguageNameListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create language name list' do
    assert_difference 'LanguageNameList.count' do
      post language_name_lists_url, params: {
        language_name_list:{
          bahasa: 'Inggris 1'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update language name list' do
    patch language_name_list_url(language_name_lists(:one)),
          params: {language_name_list: {
            bahasa: 'Jerman 2' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    language_name_lists(:one).reload
    assert_equal 'Jerman 2', language_name_lists(:one).bahasa
  end

  test 'should show language name list' do
    get language_name_list_url(language_name_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

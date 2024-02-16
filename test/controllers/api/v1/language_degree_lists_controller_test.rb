require "test_helper"

class LanguageDegreeListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:admin_michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should show all language degree list' do
    get api_v1_language_degree_lists_url, as: :json
    assert_response :success
  end

  test 'should create language degree list' do
    assert_difference 'LanguageDegreeList.count' do
      post api_v1_language_degree_lists_url, params: {
        language_degree_list:{
          tingkat: 'Profesional'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update language degree list' do
    patch api_v1_language_degree_list_url(language_degree_lists(:one)),
          params: {language_degree_list: {
            tingkat: 'Pemula' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    language_degree_lists(:one).reload
    assert_equal 'Pemula', language_degree_lists(:one).tingkat
  end

  test 'should show language degree list' do
    get api_v1_language_degree_list_url(language_degree_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end

  test 'should destroy language degree list' do
    assert_difference 'LanguageDegreeList.count', -1 do
      delete api_v1_language_degree_list_url(language_degree_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
      assert_response :success
    end
  end
end

require "test_helper"

class LanguageDegreeListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create language degree list' do
    assert_difference 'LanguageDegreeList.count' do
      post language_degree_lists_url, params: {
        language_degree_list:{
          tingkat: 'Profesional'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update language degree list' do
    patch language_degree_list_url(language_degree_lists(:one)),
          params: {language_degree_list: {
            tingkat: 'Pemula' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    language_degree_lists(:one).reload
    assert_equal 'Pemula', language_degree_lists(:one).tingkat
  end

  test 'should show language degree list' do
    get language_degree_list_url(language_degree_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

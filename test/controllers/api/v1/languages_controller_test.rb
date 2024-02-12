require "test_helper"

class LanguagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create language' do
    assert_difference 'Language.count' do
      post api_v1_languages_path, params: { language: {
        nama_bahasa: 'indonesia', tingkat: 'mahir'
      } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
    assert_not_nil Language.find_by_nama_bahasa('indonesia')
    assert_not_nil Language.find_by_tingkat('mahir')
    # insert multiple language
    assert_difference 'Language.count' do
      post api_v1_languages_path, params: { language: {
        nama_bahasa: 'mandarin', tingkat: 'pemula'
      } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
    assert_not_nil Language.find_by_nama_bahasa('mandarin')
    assert_not_nil Language.find_by_tingkat('pemula')
  end

  test 'should update language' do
    post api_v1_auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    patch api_v1_language_path(languages(:one)), params: { language: {
      nama_bahasa: 'spanyol', tingkat: 'advanced'
    } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_equal 'spanyol', languages(:one).reload.nama_bahasa
    assert_equal 'advanced', languages(:one).reload.tingkat
    # update multiple times
    patch api_v1_language_path(languages(:three)), params: { language: {
      nama_bahasa: 'batak mandailing', tingkat: 'mahir'
    } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_equal 'batak mandailing', languages(:three).reload.nama_bahasa
    assert_equal 'mahir', languages(:three).reload.tingkat
  end

  test 'should show language' do
    post api_v1_auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    get api_v1_language_url(languages(:one)), headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

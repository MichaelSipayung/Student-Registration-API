require "test_helper"

class PersonalWrongControllerTest < ActionDispatch::IntegrationTest

  def setup
    post api_v1_auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create personal, reject non permitted params' do
    assert_difference 'Personal.count' do
      post api_v1_personals_url, params: {
        "personal": {
          "nama_lengkap": "John Henry Man",
          "agama": "Muslim",
          "nik": "1234567890123498",
          "nisn": "1234567878",
          "no_kps": "123412",
          "tanggal_lahir": "2000-12-12",
          "tempat_lahir": "Dolok sanggul",
          "jenis_kelamin": "Perempuan",
          "domisili": "Jakarta timur",
          'user_id': 132100987
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_nil Personal.find_by_user_id 132100987
    assert_response :success
  end

  test 'should reject to show current users for invalid credential' do
    post api_v1_auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @tokens = body['token']
    get api_v1_personal_url(personals(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :missing
  end

  test 'should reject to update current users for invalid credential' do
    post api_v1_auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @tokens = body['token']
    get api_v1_personal_url(personals(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :missing
  end
end

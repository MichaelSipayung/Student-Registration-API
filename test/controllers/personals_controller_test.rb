require 'test_helper'

class PersonalsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create personal' do
    assert_difference 'Personal.count' do
      post personals_url, params: {
        "personal": {
          "nama_lengkap": "John Henry Man",
          "agama": "Muslim",
          "nik": "1234567890123498",
          "nisn": "1234567878",
          "no_kps": "123412",
          "tanggal_lahir": "2000-12-12",
          "tempat_lahir": "Dolok sanggul",
          "jenis_kelamin": "Perempuan",
          "domisili": "Jakarta timur"
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_not_nil Personal.find_by_nama_lengkap 'John Henry Man'
    assert_response :success
  end

  test 'should update personal' do
    post auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    patch personal_url(personals(:one)), params: {
      "personal": {
        "nama_lengkap": "John Henry",
        "agama": "Muslim",
        "nik": "1234567890123498",
        "nisn": "1234567878",
        "no_kps": "123412",
        "tanggal_lahir": "2000-12-12",
        "tempat_lahir": "Dolok sanggul",
        "jenis_kelamin": "Perempuan",
        "domisili": "Jakarta timur"
      }
    }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    personals(:one).reload
    assert_equal 'John Henry', personals(:one).nama_lengkap
    assert_equal 'Muslim', personals(:one).agama
    assert_equal 'Dolok sanggul', personals(:one).tempat_lahir
    assert_equal 'Perempuan', personals(:one).jenis_kelamin
    assert_response :success
  end

  test 'should show personal data' do
    post auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    get personal_url(personals(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

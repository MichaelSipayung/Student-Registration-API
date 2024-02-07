require "test_helper"

class UsmSchoolInformationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create new usm school information' do
    assert_difference 'UsmSchoolInformation.count' do
      post usm_school_informations_path, params: {
        usm_school_information: {
          jurusan_sekolah: 'ipa MA', asal_sekolah: 'sma santo tomas 2', akreditas: 'terakreditasi',
          jumlah_pelajaran_semester5: 15, jumlah_nilai_semester5: 799.9
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
    assert_not_nil UsmSchoolInformation.find_by_user_id users(:michael).id
    assert_not_nil UsmSchoolInformation.find_by_jurusan_sekolah 'ipa MA'
    assert_not_nil UsmSchoolInformation.find_by_asal_sekolah 'sma santo tomas 2'
    assert_not_nil UsmSchoolInformation.find_by_jumlah_pelajaran_semester5 15
    assert_not_nil UsmSchoolInformation.find_by_jumlah_nilai_semester5 799.9
  end

  test 'should update usm school information' do
    post auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    patch usm_school_information_path(usm_school_informations(:one)), params: {
      usm_school_information: {
        jurusan_sekolah: 'ipa MA', asal_sekolah: 'sma santo tomas 2', akreditas: 'terakreditasi',
        jumlah_pelajaran_semester5: 15, jumlah_nilai_semester5: 799.9
      }
    }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    usm_school_informations(:one).reload
    assert_equal 'ipa MA', usm_school_informations(:one).reload.jurusan_sekolah
    assert_equal 'sma santo tomas 2', usm_school_informations(:one).reload.asal_sekolah
    assert_equal 'terakreditasi', usm_school_informations(:one).reload.akreditas
    assert_equal 15, usm_school_informations(:one).reload.jumlah_pelajaran_semester5
    assert_equal 799.9, usm_school_informations(:one).reload.jumlah_nilai_semester5
  end

  test 'should show usm school information' do
    post auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    get personal_url(usm_school_informations(:one)), headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

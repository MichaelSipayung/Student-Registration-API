require "test_helper"

class UtbkSchoolInformationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create utbk school information' do
    assert_difference 'UtbkSchoolInformation.count' do
      post utbk_school_informations_path, params: {
        utbk_school_information: {
          asal_sekolah: 'sma 2 tarutung', jumlah_pelajaran_un: 9,
          jumlah_nilai_un: 100.5, akreditas: 'Baik', jurusan_sekolah: 'ipa'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
    assert_not_nil UtbkSchoolInformation.find_by_asal_sekolah 'sma 2 tarutung'
    assert_not_nil UtbkSchoolInformation.find_by_akreditas 'Baik'
    assert_not_nil UtbkSchoolInformation.find_by_jumlah_pelajaran_un 9
    assert_not_nil UtbkSchoolInformation.find_by_jumlah_nilai_un 100.5
  end

  test 'should update utbk school information' do
    post auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    patch utbk_school_information_path(utbk_school_informations(:one)), params: {
      utbk_school_information: {
        asal_sekolah: 'sma 2 balige', jumlah_pelajaran_un: 3,
        jumlah_nilai_un: 200.5, akreditas: 'Baik sekali'
      }
    }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    assert_equal 'sma 2 balige', utbk_school_informations(:one).reload.asal_sekolah
    assert_equal 'Baik sekali', utbk_school_informations(:one).reload.akreditas
    assert_equal  3, utbk_school_informations(:one).reload.jumlah_pelajaran_un
    assert_equal  200.5, utbk_school_informations(:one).reload.jumlah_nilai_un
  end

  test 'should show utbk school information' do
    post auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    get utbk_school_information_url(utbk_school_informations(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

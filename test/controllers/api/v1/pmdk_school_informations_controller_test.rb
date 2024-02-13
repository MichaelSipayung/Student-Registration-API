require "test_helper"

class PmdkSchoolInformationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create pmdk school information' do
    assert_difference 'PmdkSchoolInformation.count' do
      post api_v1_pmdk_school_informations_path, params: {
        pmdk_school_information: {
          jurusan_sekolah: 'slta',
          asal_sekolah: 'sma juanda timur',
          akreditas: 'Unggul',
          jumlah_nilai_un: 90.78,
          jumlah_pelajaran_un: 9
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
    assert_not_nil PmdkSchoolInformation.find_by_asal_sekolah 'sma juanda timur'
    assert_not_nil PmdkSchoolInformation.find_by_akreditas 'Unggul'
    assert_not_nil PmdkSchoolInformation.find_by_jumlah_nilai_un 90.78
    assert_not_nil PmdkSchoolInformation.find_by_jumlah_pelajaran_un 9
  end

  test 'should update pmdk school information' do
    post api_v1_auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    patch api_v1_pmdk_school_information_path(pmdk_school_informations(:one)),
          params: { pmdk_school_information: {
            asal_sekolah: 'sma juanda timur',
            akreditas: 'Unggul',
            jumlah_nilai_un: 90.78,
            jumlah_pelajaran_un: 9
          } }, headers: {'Authorization'=> "Bearer #{@token}"}, as: :json
    assert_response :success
    assert_equal 'sma juanda timur',
                 pmdk_school_informations(:one).reload.asal_sekolah
    assert_equal 'Unggul', pmdk_school_informations(:one).reload.akreditas
    assert_equal 90.78, pmdk_school_informations(:one).reload.jumlah_nilai_un
    assert_equal 9, pmdk_school_informations(:one).reload.jumlah_pelajaran_un
  end

  test 'should show pmdk school information' do
    post api_v1_auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    get api_v1_pmdk_school_information_url(pmdk_school_informations(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

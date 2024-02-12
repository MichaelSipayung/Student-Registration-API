require "test_helper"

class PmdkTotalScoreInformationControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create pmdk total score' do
    assert_difference 'PmdkTotalScoreInformation.count' do
      post api_v1_pmdk_total_score_informations_url, params: {
        pmdk_total_score_information: {
          jumlah_nilai_semester1: 120.5,
          jumlah_nilai_semester2: 122.5, jumlah_nilai_semester3: 130.9,
          jumlah_nilai_semester4: 189.9, jumlah_nilai_semester5: 189.98,
          jumlah_pelajaran_semester1: 3, jumlah_pelajaran_semester2: 6,
          jumlah_pelajaran_semester3: 12, jumlah_pelajaran_semester4: 15,
          jumlah_pelajaran_semester5: 14
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
    assert_not_nil PmdkTotalScoreInformation.find_by_jumlah_nilai_semester1 120.5
    assert_not_nil PmdkTotalScoreInformation.find_by_jumlah_nilai_semester2 122.5
    assert_not_nil PmdkTotalScoreInformation.find_by_jumlah_nilai_semester3 130.9
    assert_not_nil PmdkTotalScoreInformation.find_by_jumlah_nilai_semester4 189.9
    assert_not_nil PmdkTotalScoreInformation.find_by_jumlah_nilai_semester5 189.98
    assert_not_nil PmdkTotalScoreInformation.find_by_jumlah_pelajaran_semester1 3
    assert_not_nil PmdkTotalScoreInformation.find_by_jumlah_pelajaran_semester2 6
    assert_not_nil PmdkTotalScoreInformation.find_by_jumlah_pelajaran_semester3 12
    assert_not_nil PmdkTotalScoreInformation.find_by_jumlah_pelajaran_semester4 15
    assert_not_nil PmdkTotalScoreInformation.find_by_jumlah_pelajaran_semester5 14
  end

  test 'should update pmdk total score' do
    post api_v1_auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    patch api_v1_pmdk_total_score_information_path(pmdk_total_score_informations(:one)),
          params: {
      pmdk_total_score_information: {
        jumlah_nilai_semester1: 120.5,
        jumlah_nilai_semester2: 122.5, jumlah_nilai_semester3: 130.9,
        jumlah_nilai_semester4: 189.9, jumlah_nilai_semester5: 189.98,
        jumlah_pelajaran_semester1: 3, jumlah_pelajaran_semester2: 6,
        jumlah_pelajaran_semester3: 12, jumlah_pelajaran_semester4: 15,
        jumlah_pelajaran_semester5: 14
      }
    }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    pmdk_total_score_informations(:one).reload
    assert_equal 120.5, pmdk_total_score_informations(:one).jumlah_nilai_semester1
    assert_equal 122.5, pmdk_total_score_informations(:one).jumlah_nilai_semester2
    assert_equal 130.9, pmdk_total_score_informations(:one).jumlah_nilai_semester3
    assert_equal 189.9, pmdk_total_score_informations(:one).jumlah_nilai_semester4
    assert_equal 189.98, pmdk_total_score_informations(:one).jumlah_nilai_semester5
    assert_equal 3, pmdk_total_score_informations(:one).jumlah_pelajaran_semester1
    assert_equal 6, pmdk_total_score_informations(:one).jumlah_pelajaran_semester2
    assert_equal 12, pmdk_total_score_informations(:one).jumlah_pelajaran_semester3
    assert_equal 15, pmdk_total_score_informations(:one).jumlah_pelajaran_semester4
    assert_equal 14, pmdk_total_score_informations(:one).jumlah_pelajaran_semester5
  end

  test 'show pmdk total score information' do
    post api_v1_auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    get api_v1_pmdk_total_score_information_url(personals(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

require "test_helper"

class UtbkScoresControllerTest < ActionDispatch::IntegrationTest
  def setup
    post auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create utbk score' do
    assert_difference 'UtbkScore.count' do
      post utbk_scores_url, params: {
        utbk_score: { no_peserta: '200-1bx-2', tanggal_ujian: '2020-12-11',
                      jumlah_nilai_semester6: 1000.5, jumlah_pelajaran_semester6: 15,
                      nilai_penalaran_umum: 190.5,
                      nilai_pengetahuan_kuantitatif: 110.5,
                      nilai_kemampuan_memahami_bacaan_dan_menulis: 100.5,
                      nilai_pengetahuan_dan_pemahaman_umum: 150.5 }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
    assert_not_nil UtbkScore.find_by_no_peserta '200-1bx-2'
  end

  test 'should update utbk score' do
    post auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    patch utbk_score_path(utbk_scores(:one)), params: {
      utbk_score: { no_peserta: '200-1bx-2', tanggal_ujian: '2021-12-11',
                    jumlah_nilai_semester6: 1000.5, jumlah_pelajaran_semester6: 15,
                    nilai_penalaran_umum: 190.5,
                    nilai_pengetahuan_kuantitatif: 110.5,
                    nilai_kemampuan_memahami_bacaan_dan_menulis: 100.5,
                    nilai_pengetahuan_dan_pemahaman_umum: 150.5 }
    }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    assert_equal '200-1bx-2', utbk_scores(:one).reload.no_peserta
    assert_equal 1000.5, utbk_scores(:one).jumlah_nilai_semester6
    assert_equal 15, utbk_scores(:one).jumlah_pelajaran_semester6
    assert_equal 190.5, utbk_scores(:one).reload.nilai_penalaran_umum
    assert_equal 110.5, utbk_scores(:one).reload.nilai_pengetahuan_kuantitatif
    assert_equal 100.5, utbk_scores(:one).reload.nilai_kemampuan_memahami_bacaan_dan_menulis
    assert_equal 150.5, utbk_scores(:one).reload.nilai_pengetahuan_dan_pemahaman_umum
  end

  test 'should show utbk score' do
    post auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    get utbk_score_url(utbk_scores(:one)), headers: {'Authorization'=>"Bearer  #{@token}"},
        as: :json
    assert_response :success
  end
end

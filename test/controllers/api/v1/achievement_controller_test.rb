require "test_helper"

class AchievementControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should crate achievement' do
    assert_difference 'Achievement.count' do
      post api_v1_achievements_path, params: { achievement: {
        nama_prestasi: 'pencak silat', tahun: '2022-12-14', tingkat: 'nasional',
        kategori: 'non akademik'
      } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
    assert_not_nil Achievement.find_by_nama_prestasi('pencak silat')
    # insert multiple times
    assert_difference 'Achievement.count' do
      post api_v1_achievements_path, params: { achievement: {
        nama_prestasi: 'olimpiade sains', tahun: '2022-12-14', tingkat: 'internasional',
        kategori: 'non akademik'
      } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
    assert_not_nil Achievement.find_by_nama_prestasi('olimpiade sains')
  end

  test 'should update achievement' do
    post api_v1_auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    patch api_v1_achievement_path(achievements(:one)), params: { achievement: {
      nama_prestasi: 'lompat jauh', tahun: '2021-10-12',
      kategori: 'non akademik', tingkat: 'provinsi'
    } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    assert_equal 'lompat jauh',
                 achievements(:one).reload.nama_prestasi
    assert_equal 'non akademik',
                 achievements(:one).reload.kategori
    assert_equal 'provinsi', achievements(:one).reload.tingkat
    assert_not_equal achievements(:one).reload.nama_prestasi,
                     achievements(:three).reload.nama_prestasi
    # update multiple times
    patch api_v1_achievement_path(achievements(:three)), params: { achievement: {
      nama_prestasi: 'tenis meja', tahun: '2020-10-12',
      kategori: 'akademik', tingkat: 'internasional'
    } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    assert_equal 'tenis meja',
                 achievements(:three).reload.nama_prestasi
    assert_equal 'akademik',
                 achievements(:three).reload.kategori
    assert_equal 'internasional',
                 achievements(:three).reload.tingkat
  end

  test 'should show achievement' do
    post api_v1_auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    get api_v1_achievement_url(achievements(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

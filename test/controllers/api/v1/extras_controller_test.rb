require "test_helper"

class ExtrasControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test'should create new extra' do
    assert_difference 'Extra.count' do
      post api_v1_extras_path, params:
        { extra: { nama_kegiatan: 'extakurikuler 1', mulai: '2020-12-11',
                   berakhir: '2021-12-13', predikat: 'lulus' } },
           headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
    assert_not_nil Extra.find_by_nama_kegiatan 'extakurikuler 1'
    assert_difference 'Extra.count' do
      post api_v1_extras_path, params:
        { extra: { nama_kegiatan: 'extakurikuler 2', mulai: '2020-12-11',
                   berakhir: '2021-12-13', predikat: 'tidak lulus' } },
           headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
    assert_not_nil Extra.find_by_nama_kegiatan 'extakurikuler 2'
    assert_not_nil Extra.find_by_nama_kegiatan 'extakurikuler 1'
  end

  test 'should update extra' do
    post api_v1_auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    patch api_v1_extra_path(extras(:one)), params: { extra: {
      nama_kegiatan: 'osis', mulai: '2022-12-09',
      berakhir: '2023-12-11', predikat: 'lulus kegiatan'
    } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_equal 'osis', extras(:one).reload.nama_kegiatan
    assert_equal 'lulus kegiatan', extras(:one).reload.predikat
    # update multiple times
    patch api_v1_extra_path(extras(:three)), params: { extra: {
      nama_kegiatan: 'jitsu', mulai: '2022-12-09',
      berakhir: '2023-12-11', predikat: 'lulus'
    } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_equal 'jitsu', extras(:three).reload.nama_kegiatan
    assert_equal 'lulus', extras(:three).reload.predikat
  end

  test 'should show extra' do
    post api_v1_auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    get api_v1_extra_url(extras(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

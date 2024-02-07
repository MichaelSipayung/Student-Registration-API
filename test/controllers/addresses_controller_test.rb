require "test_helper"

class AddressesControllerTest < ActionDispatch::IntegrationTest
  def setup
    post auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create address' do
    assert_difference 'Address.count' do
      post addresses_path, params: { address: {
        alamat: 'jambi', kelurahan: 'example', kecamatan: 'example',
        kode_pos: 12_345, provinsi: 'example', no_telepon: 1_234_567_890,
        kabupaten: 'example'
      } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
    assert_not_nil Address.find_by_alamat('jambi')
    # multiple address inserted
    assert_difference 'Address.count' do
      post addresses_path, params: { address: {
        alamat: 'malasyia', kelurahan: 'example', kecamatan: 'example',
        kode_pos: 12_345, provinsi: 'example', no_telepon: 1_234_567_890,
        kabupaten: 'example'
      } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
    assert_not_nil Address.find_by_alamat('malasyia')
  end

  test 'should update address' do
    post auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    patch address_path(addresses(:one)), params: { address: {
      alamat: 'malasyia', kelurahan: 'kuala lumpur', kecamatan: 'desa lau',
      kode_pos: 12_346, provinsi: 'malasyia', no_telepon: 1_234_567_899,
      kabupaten: 'dolok sihol'
    } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_equal 'malasyia', addresses(:one).reload.alamat
    assert_equal 'kuala lumpur', addresses(:one).reload.kelurahan
    assert_equal 'desa lau', addresses(:one).reload.kecamatan
    assert_equal 'malasyia', addresses(:one).reload.provinsi
    assert_equal 'dolok sihol', addresses(:one).reload.kabupaten
    assert_equal 12_346, addresses(:one).reload.kode_pos
  end

  test 'should show address' do
    post auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    get address_url(addresses(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

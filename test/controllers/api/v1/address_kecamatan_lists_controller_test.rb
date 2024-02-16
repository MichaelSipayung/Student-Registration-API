require "test_helper"

class AddressKecamatanListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:admin_michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should show all kabupaten list' do
    get api_v1_address_kecamatan_lists_url, as: :json
    assert_response :success
  end

  test 'should create kabupaten list' do
    @kab = address_kabupaten_lists(:acehtengah)
    assert_difference('AddressKecamatanList.count') do
      post api_v1_address_kecamatan_lists_url, params: {
        address_kecamatan_list: { kecamatan: 'aceh barat',
                                  address_kabupaten_list_id: @kab.id } },
           headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update kabupaten' do
    patch api_v1_address_kecamatan_list_url(address_kecamatan_lists(:kecacehtengah)),
          params: {address_kecamatan_list: {
            kecamatan: 'aceh selatan' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    address_kecamatan_lists(:kecacehtengah).reload
    assert_equal 'aceh selatan',
                 address_kecamatan_lists(:kecacehtengah).kecamatan
  end

  test 'should show kabupaten list' do
    get api_v1_address_kecamatan_list_url(address_kecamatan_lists(:kecacehtengah)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end

  test 'should destroy kabupaten list' do
    assert_difference 'AddressKecamatanList.count', -1 do
      delete api_v1_address_kecamatan_list_url(address_kecamatan_lists(:kecacehtengah)),
      headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
      assert_response :success
    end
  end
end

require "test_helper"

class AddressKecamatanListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create kabupaten list' do
    @kab = address_kabupaten_lists(:acehtengah)
    assert_difference('AddressKecamatanList.count') do
      post address_kecamatan_lists_url, params: {
        address_kecamatan_list: { kecamatan: 'aceh barat',
                                  address_kabupaten_list_id: @kab.id } },
           headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update kabupaten' do
    patch address_kecamatan_list_url(address_kecamatan_lists(:kecacehtengah)),
          params: {address_kecamatan_list: {
            kecamatan: 'aceh selatan' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    address_kecamatan_lists(:kecacehtengah).reload
    assert_equal 'aceh selatan',
                 address_kecamatan_lists(:kecacehtengah).kecamatan
  end

  test 'should show kabupaten list' do
    get address_kecamatan_list_url(address_kecamatan_lists(:kecacehtengah)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

require "test_helper"

class AddressProvinceListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:admin_michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should show all province list' do
    get api_v1_address_province_lists_url, as: :json
    assert_response :success
  end

  test 'should create province list' do
    assert_difference 'AddressProvinceList.count' do
      post api_v1_address_province_lists_url, params: {
        address_province_list:{
          provinsi: 'NTT Utara'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update province' do
    patch api_v1_address_province_list_url(address_province_lists(:aceh)),
          params: {address_province_list: {
            provinsi: 'Bangka Belitung' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    address_province_lists(:aceh).reload
    assert_equal 'Bangka Belitung', address_province_lists(:aceh).provinsi
  end

  test 'should show province list' do
    get api_v1_address_province_list_url(address_province_lists(:aceh)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end

  test 'should destroy province list' do
    assert_difference 'AddressProvinceList.count', -1 do
      delete api_v1_address_province_list_url(address_province_lists(:aceh)),
          headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
      assert_response :success
    end
  end
end

require "test_helper"

class SourceInformationListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:admin_michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should show all source information list' do
    get api_v1_source_information_lists_url, as: :json
    assert_response :success
  end

  test 'should create source information list' do
    assert_difference 'SourceInformationList.count' do
      post api_v1_source_information_lists_url, params: {
        source_information_list:{
          informasi: 'Media Cetak'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update source information list' do
    patch api_v1_source_information_list_url(source_information_lists(:one)),
          params: {source_information_list: {
            informasi: 'Facebook' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    source_information_lists(:one).reload
    assert_equal 'Facebook', source_information_lists(:one).informasi
  end

  test 'should show source information list' do
    get api_v1_source_information_list_url(source_information_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end

  test 'should destroy source information list' do
    assert_difference 'SourceInformationList.count', -1 do
      delete api_v1_source_information_list_url(source_information_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
      assert_response :success
    end
  end
end

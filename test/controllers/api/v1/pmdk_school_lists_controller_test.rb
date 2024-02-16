require "test_helper"

class PmdkSchoolListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:admin_michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should show all pmdk school list' do
    get api_v1_pmdk_school_lists_url, as: :json
    assert_response :success
  end

  test 'should create pmdk school list' do
    assert_difference 'PmdkSchoolList.count' do
      post api_v1_pmdk_school_lists_url, params: {
        pmdk_school_list:{
          sekolah: 'SMA Naucipta'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update pmdk school list' do
    patch api_v1_pmdk_school_list_url(pmdk_school_lists(:one)),
          params: {pmdk_school_list: {
            sekolah: 'SMK Agung' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    pmdk_school_lists(:one).reload
    assert_equal 'SMK Agung', pmdk_school_lists(:one).sekolah
  end

  test 'should show pmdk school list' do
    get api_v1_pmdk_school_list_url(pmdk_school_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end

  test 'should destroy pmdk school list' do
    assert_difference 'PmdkSchoolList.count', -1 do
      delete api_v1_pmdk_school_list_url(pmdk_school_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
      assert_response :success
    end

  end
end

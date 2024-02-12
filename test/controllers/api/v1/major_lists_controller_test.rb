require "test_helper"

class MajorListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create major list' do
    assert_difference 'MajorList.count' do
      post api_v1_major_lists_url, params: {
        major_list:{
          jurusan: 'Teknik Kimia'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update major list' do
    patch api_v1_major_list_url(major_lists(:one)),
          params: {major_list: {
            jurusan: 'Sistem Informasi' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    major_lists(:one).reload
    assert_equal 'Sistem Informasi', major_lists(:one).jurusan
  end

  test 'should show major list' do
    get api_v1_major_list_url(major_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

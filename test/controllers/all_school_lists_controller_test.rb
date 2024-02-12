require "test_helper"

class AllSchoolListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create school list' do
    assert_difference 'AllSchoolList.count' do
      post all_school_lists_url, params: {
        all_school_list:{
          sekolah: 'SMA Naucipta'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update school list' do
    patch all_school_list_url(all_school_lists(:one)),
          params: {all_school_list: {
            sekolah: 'SMK Agung' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    all_school_lists(:one).reload
    assert_equal 'SMK Agung', all_school_lists(:one).sekolah
  end

  test 'should show province list' do
    get all_school_list_url(all_school_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

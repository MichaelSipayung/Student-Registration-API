require "test_helper"

class HighSchoolMajorListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create high school major list' do
    assert_difference 'HighSchoolMajorList.count' do
      post high_school_major_lists_url, params: {
        high_school_major:{
          jurusan: 'SMA IPA'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update high school major list' do
    patch high_school_major_list_url(high_school_major_lists(:one)),
          params: {high_school_major: {
            jurusan: 'SMA IPS' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    high_school_major_lists(:one).reload
    assert_equal 'SMA IPS', high_school_major_lists(:one).jurusan
  end

  test 'should show high school major list' do
    get high_school_major_list_url(high_school_major_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

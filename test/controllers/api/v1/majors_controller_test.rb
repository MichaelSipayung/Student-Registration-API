require "test_helper"

class MajorsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create new major' do
    assert_difference 'Major.count' do
      post api_v1_majors_url, params: { major: {
        jurusan1: 'fisika', jurusan2: 'biology', jurusan3: 'math',
        gelombang: 'pmdk sumut'
      } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
    assert_not_nil Major.find_by_jurusan1 'fisika'
    assert_not_nil Major.find_by_jurusan2 'biology'
    assert_not_nil Major.find_by_jurusan3 'math'
    assert_not_nil Major.find_by_gelombang 'pmdk sumut'
  end

  test 'should update major' do
    post api_v1_auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    patch api_v1_major_url(majors(:one)), params: { major: {
      jurusan1: 'fisika 1', jurusan2: 'fisika 2', jurusan3: 'math 1',
      gelombang: 'pmdk sumut baru'
    } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    assert_equal 'fisika 1', majors(:one).reload.jurusan1
    assert_equal 'fisika 2', majors(:one).reload.jurusan2
    assert_equal 'math 1', majors(:one).reload.jurusan3
    assert_equal 'pmdk sumut baru', majors(:one).reload.gelombang
  end

  test 'shoul show major' do
    post api_v1_auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    get api_v1_major_url(majors(:one)), headers: {'Authorization'=>"Bearer #{@token}"},
        as: :json
    assert_response :success
  end
end

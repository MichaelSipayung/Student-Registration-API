require "test_helper"

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create organization' do
    assert_difference 'Organization.count' do
      post api_v1_organizations_url, params: { organization: {
        nama_organisasi: 'osis sma', mulai: '2020-12-11',
        berakhir: '2011-10-11', jabatan: 'ketua pertama'
      } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
    assert_not_nil Organization.find_by_nama_organisasi('osis sma')
    assert_not_nil Organization.find_by_jabatan('ketua pertama')
    # insert multiple times
    assert_difference 'Organization.count' do
      post api_v1_organizations_url, params: { organization: {
        nama_organisasi: 'pmk upi', mulai: '2020-12-11',
        berakhir: '2011-10-11', jabatan: 'sekretaris ahli'
      } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
    assert_not_nil Organization.find_by_nama_organisasi('pmk upi')
    assert_not_nil Organization.find_by_jabatan('sekretaris ahli')
  end

  test 'should update organization' do
    post api_v1_auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    patch api_v1_organization_path(organizations(:one)), params: { organization: {
      nama_organisasi: 'pmk ui jakarta', mulai: '2020-12-11',
      berakhir: '2011-10-11', jabatan: 'wakil ketua pmk'
    } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    assert_equal 'pmk ui jakarta', organizations(:one).reload.nama_organisasi
    assert_equal 'wakil ketua pmk', organizations(:one).reload.jabatan

    patch api_v1_organization_path(organizations(:three)), params: { organization: {
      nama_organisasi: 'pmk ui medan', mulai: '2020-12-11',
      berakhir: '2011-10-11', jabatan: 'wakil ketua'
    } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    assert_equal 'pmk ui medan', organizations(:three).reload.nama_organisasi
    assert_equal 'wakil ketua', organizations(:three).reload.jabatan
  end

  test 'should show organization' do
    post api_v1_auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    get api_v1_organization_url(organizations(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end

end

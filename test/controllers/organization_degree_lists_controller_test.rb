require "test_helper"

class OrganizationDegreeListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create organization degree list' do
    assert_difference 'OrganizationDegreeList.count' do
      post organization_degree_lists_url, params: {
        organization_degree_list:{
          jabatan: 'Ketua'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update organization degree list' do
    patch organization_degree_list_url(organization_degree_lists(:one)),
          params: {organization_degree_list: {
            jabatan: 'Wakil Ketua' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    organization_degree_lists(:one).reload
    assert_equal 'Wakil Ketua', organization_degree_lists(:one).jabatan
  end

  test 'should show major list' do
    get organization_degree_list_url(organization_degree_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

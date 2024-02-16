require "test_helper"

class Api::V1::AccreditationSchoolListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:admin_michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create accreditation list' do
    assert_difference 'AccreditationSchoolList.count' do
      post api_v1_accreditation_school_lists_url, params: {
        "accreditation_school_list":{
          akreditasi: 'unggul'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
  end

  test 'should update accreditation' do
    patch api_v1_accreditation_school_list_url(accreditation_school_lists(:one)),
                       params: {'accreditation_school_list': {
                         akreditasi: 'sempurna' }
                       }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    accreditation_school_lists(:one).reload
    assert_equal 'sempurna', accreditation_school_lists(:one).akreditasi
  end

  test 'should show accreditation list' do
    get api_v1_accreditation_school_list_url(accreditation_school_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
  end

  test 'should destroy accreditation list' do
    assert_difference 'AccreditationSchoolList.count', -1 do
      delete api_v1_accreditation_school_list_url(accreditation_school_lists(:one)),
             headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
  end
end
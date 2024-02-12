require "test_helper"

class AccreditationSchoolListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create accreditation list' do
    assert_difference 'AccreditationSchoolList.count' do
      post accreditation_school_lists_url, params: {
        "accreditation_school_list":{
          akreditasi: 'unggul'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
  end

  test 'should update accreditation' do
    patch accreditation_school_list_url(accreditation_school_lists(:one)),
                       params: {'accreditation_school_list': {
                         akreditasi: 'sempurna' }
                       }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    accreditation_school_lists(:one).reload
    assert_equal 'sempurna', accreditation_school_lists(:one).akreditasi
  end

  test 'should show accreditasion list' do
    get accreditation_school_list_url(accreditation_school_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
  end

end
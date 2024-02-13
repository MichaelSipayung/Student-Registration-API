require "test_helper"

class SourceMotivationListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create source motivation list' do
    assert_difference 'SourceMotivationList.count' do
      post api_v1_source_motivation_lists_url, params: {
        source_motivation_list:{
          motivasi: 'Pendidikan'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update source motivation list' do
    patch api_v1_source_motivation_list_url(source_motivation_lists(:one)),
          params: {source_motivation_list: {
            motivasi: 'Pekerjaan' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    source_motivation_lists(:one).reload
    assert_equal 'Pekerjaan', source_motivation_lists(:one).motivasi
  end

  test 'should show source motivation list' do
    get api_v1_source_motivation_list_url(source_motivation_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end

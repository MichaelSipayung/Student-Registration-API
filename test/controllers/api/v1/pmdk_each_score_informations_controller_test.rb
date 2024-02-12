require "test_helper"

class PmdkEachScoreInformationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create pmdk eachh score information' do
    assert_difference 'PmdkEachScoreInformation.count' do
      post api_v1_pmdk_each_score_informations_url, params: { pmdk_each_score_information: {
        matematika1: 90, matematika2: 80,
        matematika3: 89, matematika4: 90.8,
        matematika5: 88.9, kimia1: 98.9,
        kimia2: 98.3, kimia3: 88.7,
        kimia4: 88.5, kimia5: 88.1,
        fisika1: 34.9, fisika2: 99.9,
        fisika3: 88.9, fisika4: 99.7,
        fisika5: 67.7, inggris1: 88.5,
        inggris2: 56.8, inggris3: 77.2,
        inggris4: 88.1, inggris5: 99.3
      } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
    assert_not_nil PmdkEachScoreInformation.find_by_user_id users(:michael).id
    assert_not_nil PmdkEachScoreInformation.find_by_fisika1 34.9
    assert_not_nil PmdkEachScoreInformation.find_by_fisika2 99.9
    assert_not_nil PmdkEachScoreInformation.find_by_fisika3 88.9
    assert_not_nil PmdkEachScoreInformation.find_by_fisika4 99.7
    assert_not_nil PmdkEachScoreInformation.find_by_fisika5 67.7
    assert_not_nil PmdkEachScoreInformation.find_by_matematika1 90
    assert_not_nil PmdkEachScoreInformation.find_by_matematika2 80
    assert_not_nil PmdkEachScoreInformation.find_by_matematika3 89
    assert_not_nil PmdkEachScoreInformation.find_by_matematika4 90.8
    assert_not_nil PmdkEachScoreInformation.find_by_matematika5 88.9
    assert_not_nil PmdkEachScoreInformation.find_by_kimia1 98.9
    assert_not_nil PmdkEachScoreInformation.find_by_kimia2 98.3
    assert_not_nil PmdkEachScoreInformation.find_by_kimia3 88.7
    assert_not_nil PmdkEachScoreInformation.find_by_kimia4 88.5
    assert_not_nil PmdkEachScoreInformation.find_by_kimia5 88.1
    assert_not_nil PmdkEachScoreInformation.find_by_inggris1 88.5
    assert_not_nil PmdkEachScoreInformation.find_by_inggris2 56.8
    assert_not_nil PmdkEachScoreInformation.find_by_inggris3 77.2
    assert_not_nil PmdkEachScoreInformation.find_by_inggris4 88.1
    assert_not_nil PmdkEachScoreInformation.find_by_inggris5 99.3
  end

  test 'should update pmdk each score information' do
    post api_v1_auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    patch api_v1_pmdk_each_score_information_url(pmdk_each_score_informations(:one)),
          params: { pmdk_each_score_information: {
            matematika1: 90.12, matematika2: 17.8,
            matematika3: 89, matematika4: 90.8,
            matematika5: 88.9, kimia1: 98.9,
            kimia2: 98.3, kimia3: 88.7,
            kimia4: 88.5, kimia5: 88.1,
            fisika1: 34.9, fisika2: 99.9,
            fisika3: 88.9, fisika4: 99.7,
            fisika5: 67.7, inggris1: 88.5,
            inggris2: 56.8, inggris3: 77.2,
            inggris4: 88.1, inggris5: 99.3
          } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    pmdk_each_score_informations(:one).reload
    assert_equal 90.12, pmdk_each_score_informations(:one).matematika1
    assert_equal 17.8, pmdk_each_score_informations(:one).matematika2
    assert_equal 89, pmdk_each_score_informations(:one).matematika3
    assert_equal 90.8, pmdk_each_score_informations(:one).matematika4
    assert_equal 88.9, pmdk_each_score_informations(:one).matematika5
    assert_equal 99.3, pmdk_each_score_informations(:one).inggris5
    assert_equal 88.1, pmdk_each_score_informations(:one).inggris4
    assert_equal 77.2, pmdk_each_score_informations(:one).inggris3
    assert_equal 56.8, pmdk_each_score_informations(:one).inggris2
    assert_equal 88.5, pmdk_each_score_informations(:one).inggris1
  end

  test 'should show pmdk each score information' do
    post api_v1_auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    get api_v1_pmdk_each_score_information_url(pmdk_each_score_informations(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end

end

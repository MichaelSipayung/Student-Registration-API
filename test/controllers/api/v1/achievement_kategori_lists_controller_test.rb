require "test_helper"

class AchievementKategoriListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:admin_michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should show all achievement category' do
    get api_v1_achievement_kategori_lists_url, as: :json
    assert_response :success
  end

  test 'should create achievement kategori' do
    assert_difference('AchievementKategoriList.count') do
      post api_v1_achievement_kategori_lists_url, params: {
        achievement_kategori_list: { kategori: 'non akademik' }
      }, headers: {'Authorization' => "Bearer #{@token}" }, as: :json
    end
    assert_response :success
  end

  test 'should update achievement kategori' do
    patch api_v1_achievement_kategori_list_url(achievement_kategori_lists(:one)),
          params: {
            achievement_kategori_list: { kategori: 'non akademik' }
          }, headers: {'Authorization' => "Bearer #{@token}" }, as: :json
    assert_response :success
    assert_equal 'non akademik',
                 achievement_kategori_lists(:one).reload.kategori
  end

  test 'should show achievement kategori' do
    get api_v1_achievement_kategori_list_url(achievement_kategori_lists(:one)),
        headers: {'Authorization' => "Bearer #{@token}" }, as: :json
    assert_response :success
  end

  test 'should destroy achievement category' do
    assert_difference 'AchievementKategoriList.count', -1 do
      delete api_v1_achievement_kategori_list_url(achievement_kategori_lists(:one)),
             headers: {'Authorization' => "Bearer #{@token}" }, as: :json
    end
  end
end

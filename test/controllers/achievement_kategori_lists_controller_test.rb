require "test_helper"

class AchievementKategoriListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create achievement kategori' do
    assert_difference('AchievementKategoriList.count') do
      post achievement_kategori_lists_url, params: {
        achievement_kategori_list: { kategori: 'non akademik' }
      }, headers: {'Authorization' => "Bearer #{@token}" }, as: :json
    end
    assert_response :success
  end

  test 'should update achievement kategori' do
    patch achievement_kategori_list_url(achievement_kategori_lists(:one)),
          params: {
            achievement_kategori_list: { kategori: 'non akademik' }
          }, headers: {'Authorization' => "Bearer #{@token}" }, as: :json
    assert_response :success
    assert_equal 'non akademik',
                 achievement_kategori_lists(:one).reload.kategori
  end

  test 'should show achievement kategori' do
    get achievement_kategori_list_url(achievement_kategori_lists(:one)),
        headers: {'Authorization' => "Bearer #{@token}" }, as: :json
    assert_response :success
  end
end

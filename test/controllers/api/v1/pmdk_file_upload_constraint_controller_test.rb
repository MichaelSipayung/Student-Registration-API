require "test_helper"
class PmdkFileUploadControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  # test 'should reject for non valid pmdk file upload' do
  #   image = fixture_file_upload('test/fixtures/files/Berlian.pdf', 'application/pdf')
  #   image1 = fixture_file_upload('test/fixtures/files/thumnail.jpg', 'image/jpeg')
  #   image2 = fixture_file_upload('test/fixtures/files/tpa.jpg', 'image/jpeg')
  #   assert_difference 'PmdkFileUpload.count' do
  #     assert_difference 'ActiveStorage::Attachment.count', 3 do
  #       assert_difference 'ActiveStorage::Blob.count', 3 do
  #         post api_v1_pmdk_file_uploads_url, params: {
  #             sertifikat: image,
  #             surat_rekomendasi: image1,
  #             nilai_rapor: image2,
  #             # created_at: 100.day.ago
  #         }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :multipart
  #       end
  #     end
  #   end
end

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

  test 'should show pmdk file upload' do
    image = fixture_file_upload('test/fixtures/files/Berlian.pdf', 'application/pdf')
    image1 = fixture_file_upload('test/fixtures/files/thumnail.jpg', 'image/jpeg')
    image2 = fixture_file_upload('test/fixtures/files/tpa.jpg', 'image/jpeg')
    assert_difference 'PmdkFileUpload.count' do
      assert_difference 'ActiveStorage::Attachment.count', 3 do
        assert_difference 'ActiveStorage::Blob.count', 3 do
          post api_v1_pmdk_file_uploads_url, params: {
              sertifikat: image,
              surat_rekomendasi: image1,
              nilai_rapor: image2,
              # created_at: 100.day.ago
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :multipart
        end
      end
    end
    assert_response :success
    assert_equal true, PmdkFileUpload.last.sertifikat.attached?
    assert_equal true, PmdkFileUpload.last.surat_rekomendasi.attached?
    assert_equal true, PmdkFileUpload.last.nilai_rapor.attached?
    assert_equal 'pmdk file upload success', JSON.parse(response.body)['message']
    assert_equal 'Berlian.pdf', PmdkFileUpload.last.sertifikat.filename.to_s
    assert_equal 'thumnail.jpg', PmdkFileUpload.last.surat_rekomendasi.filename.to_s
    assert_equal 'tpa.jpg', PmdkFileUpload.last.nilai_rapor.filename.to_s

    get api_v1_pmdk_file_upload_url(PmdkFileUpload.last.id),
      headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    assert_equal 'Berlian.pdf', JSON.parse(response.body)['sertifikat'].split('/').last
    assert_equal 'thumnail.jpg', JSON.parse(response.body)['surat_rekomendasi'].split('/').last
    assert_equal 'tpa.jpg', JSON.parse(response.body)['nilai_rapor'].split('/').last
  end
end

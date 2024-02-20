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

  test 'should create pmdk file upload' do
    image = fixture_file_upload('test/fixtures/files/kpm.png', 'image/png')
    image1 = fixture_file_upload('test/fixtures/files/thumnail.jpg', 'image/jpeg')
    image2 = fixture_file_upload('test/fixtures/files/tpa.jpg', 'image/jpeg')

    assert_difference 'PmdkFileUpload.count' do
      assert_difference 'ActiveStorage::Attachment.count', 3 do
        assert_difference 'ActiveStorage::Blob.count', 3 do
          post api_v1_pmdk_file_uploads_url, params: {
              sertifikat: image,
              surat_rekomendasi: image1,
              nilai_rapor: image2
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :multipart
        end
      end
    end
  end

  test 'should not create pmdk file upload if already exist' do
    image = fixture_file_upload('test/fixtures/files/kpm.png', 'image/png')
    image1 = fixture_file_upload('test/fixtures/files/thumnail.jpg', 'image/jpeg')
    image2 = fixture_file_upload('test/fixtures/files/tpa.jpg', 'image/jpeg')

    assert_difference 'PmdkFileUpload.count', 1 do
      assert_difference 'ActiveStorage::Attachment.count', 3 do
        assert_difference 'ActiveStorage::Blob.count', 3 do
          post api_v1_pmdk_file_uploads_url, params: {
              sertifikat: image,
              surat_rekomendasi: image1,
              nilai_rapor: image2,
              created_at: 1.day.ago
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :multipart
        end
      end
    end
    # upload again with same file
    assert_no_difference 'PmdkFileUpload.count' do
      assert_no_difference 'ActiveStorage::Attachment.count' do
        assert_no_difference 'ActiveStorage::Blob.count' do
          post api_v1_pmdk_file_uploads_url, params: {
              sertifikat: image,
              surat_rekomendasi: image1,
              nilai_rapor: image2,
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :multipart
        end
      end
    end
    assert_equal 'pmdk file upload already exist, go update it', response.parsed_body['errors']
  end

end

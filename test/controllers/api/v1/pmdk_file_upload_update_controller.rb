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

  test 'should update pmdk file upload' do
    image = fixture_file_upload('test/fixtures/files/kpm.png', 'image/png')
    image1 = fixture_file_upload('test/fixtures/files/thumnail.jpg', 'image/jpeg')
    image2 = fixture_file_upload('test/fixtures/files/tpa.jpg', 'image/jpeg')
    assert_difference 'PmdkFileUpload.count' do
      assert_difference 'ActiveStorage::Attachment.count', 3 do
        assert_difference 'ActiveStorage::Blob.count', 3 do
          post api_v1_pmdk_file_uploads_url, params: {
            pmdk_file_upload: {
              sertifikat: image,
              surat_rekomendasi: image1,
              nilai_rapor: image2
            }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :multipart
        end
      end
    end
    assert_response :success
    # test updated the uploaded file
    image = fixture_file_upload('test/fixtures/files/Berlian.pdf', 'application/pdf')
    image1 = fixture_file_upload('test/fixtures/files/download.png', 'image/png')
    image2 = fixture_file_upload('test/fixtures/files/kpm.png', 'image/png')
    patch api_v1_pmdk_file_upload_url(PmdkFileUpload.last.id), params: {
      pmdk_file_upload: {
        sertifikat: image,
        surat_rekomendasi: image1,
        nilai_rapor: image2
      }
    }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :multipart
    assert_response :success
    assert_equal true, PmdkFileUpload.last.sertifikat.attached?
    assert_equal true, PmdkFileUpload.last.surat_rekomendasi.attached?
    assert_equal true, PmdkFileUpload.last.nilai_rapor.attached?
    assert_equal 'pmdk file upload updated', JSON.parse(response.body)['message']
    # compare the old active_storange_blob filenames with the new one
    assert_equal 'Berlian.pdf', PmdkFileUpload.last.sertifikat.filename.to_s
    assert_equal 'download.png', PmdkFileUpload.last.surat_rekomendasi.filename.to_s
    assert_equal 'kpm.png', PmdkFileUpload.last.nilai_rapor.filename.to_s
  end
end

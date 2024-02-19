require "test_helper"

class UtbkFileUploadUpdateControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should update utbk file upload' do
    image = fixture_file_upload('test/fixtures/files/kpm.png', 'image/png')
    assert_difference 'UtbkFileUpload.count' do
      assert_difference 'ActiveStorage::Attachment.count', 1 do
        assert_difference 'ActiveStorage::Blob.count', 1 do
          post api_v1_utbk_file_uploads_url, params: {
            utbk_file_upload: {
              sertifikat_utbk: image
            }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :multipart
        end
      end
    end
    assert_response :success
    assert_equal true, UtbkFileUpload.last.sertifikat_utbk.attached?
    assert_equal 'utbk file upload created', JSON.parse(response.body)['message']
    assert_equal true, JSON.parse(response.body)['sertifikat_utbk_uploaded']
    assert_equal 'kpm.png', UtbkFileUpload.last.sertifikat_utbk.filename.to_s
    # case for update
    image = fixture_file_upload('test/fixtures/files/Berlian.pdf', 'application/pdf')
    patch api_v1_utbk_file_upload_url(UtbkFileUpload.last.id), params: {
      utbk_file_upload: {
        sertifikat_utbk: image
      }
    }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :multipart
    assert_response :success
    assert_equal true, UtbkFileUpload.last.sertifikat_utbk.attached?
    assert_equal 'utbk file upload updated', JSON.parse(response.body)['message']
    assert_equal true, JSON.parse(response.body)['sertifikat_utbk_uploaded']
    assert_equal 'Berlian.pdf', UtbkFileUpload.last.sertifikat_utbk.filename.to_s
  end

end

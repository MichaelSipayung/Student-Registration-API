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

  test 'should reject upload for invalid utbk file upload (extension)' do
    # check if the file is created
    assert_equal 0, UtbkFileUpload.count
    image = fixture_file_upload('test/fixtures/files/samplef.txt', 'application/txt')
    assert_no_difference 'UtbkFileUpload.count' do
      assert_no_difference 'ActiveStorage::Attachment.count' do
        assert_no_difference 'ActiveStorage::Blob.count' do
          post api_v1_utbk_file_uploads_url, params: {
            sertifikat_utbk: image
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :multipart
        end
      end
    end
    assert_response :unprocessable_entity
    json_response = JSON.parse(response.body)
    assert_equal ["Sertifikat utbk has an invalid content type"],
      json_response['errors']
  end

  test 'should reject upload for invalid utbk file upload (size)' do
    image = fixture_file_upload('test/fixtures/files/cis.pdf', 'application/pdf')
    utbk_file_upload = UtbkFileUpload.new(sertifikat_utbk: image, user_id: users(:michael).id)
    assert_not utbk_file_upload.valid?
    assert_equal 0, UtbkFileUpload.count
    assert_includes utbk_file_upload.errors.full_messages,
      "Sertifikat utbk size 4.54 MB is not between required range"
  end

  test 'should accept the valid utbk file size' do
    image = fixture_file_upload('test/fixtures/files/Berlian.pdf', 'application/pdf')
    utbk_file_upload = UtbkFileUpload.new(sertifikat_utbk: image, user_id: users(:michael).id)
    assert utbk_file_upload.valid?
    utbk_file_upload.save
    assert_equal 1, UtbkFileUpload.count
  end

end

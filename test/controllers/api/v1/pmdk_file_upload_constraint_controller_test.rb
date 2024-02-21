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
  # should refactor this to model test
  test 'should reject for invalid extension pmdk file' do
    image = fixture_file_upload('test/fixtures/files/samplef.txt', 'application/text')
    pmdk_file_upload = PmdkFileUpload.new(surat_rekomendasi: image,
                          nilai_rapor: image, sertifikat: image, user_id: users(:michael).id)
    assert_not pmdk_file_upload.save
    assert_not pmdk_file_upload.valid?
    assert_equal 0, PmdkFileUpload.count
  end

  test 'should accept valid extension pmdk file' do
    image = fixture_file_upload('test/fixtures/files/tpa.jpg', 'image/jpeg')
    pmdk_file_upload = PmdkFileUpload.new(surat_rekomendasi: image,
                          nilai_rapor: image, sertifikat: image, user_id: users(:michael).id)
    begin
      assert pmdk_file_upload.save!
    rescue => e
      puts "Exception message: #{e.message}"
    end
    assert pmdk_file_upload.valid?
    assert_equal 1, PmdkFileUpload.count
  end

  test 'should reject for invalid size pmdk file' do
    image = fixture_file_upload('test/fixtures/files/cis.pdf', 'application/pdf')
    pmdk_file_upload = PmdkFileUpload.new(surat_rekomendasi: image,
                          nilai_rapor: image, sertifikat: image, user_id: users(:michael).id)
    assert_not pmdk_file_upload.save
    assert_not pmdk_file_upload.valid?
    assert_equal 0, PmdkFileUpload.count
    assert_includes pmdk_file_upload.errors.full_messages,
      "Surat rekomendasi size 4.54 MB is not between required range"
    assert_includes pmdk_file_upload.errors.full_messages,
      "Nilai rapor size 4.54 MB is not between required range"
    assert_includes pmdk_file_upload.errors.full_messages,
      "Sertifikat size 4.54 MB is not between required range"
  end

  test 'should accept valid size pmdk file' do
    image = fixture_file_upload('test/fixtures/files/Berlian.pdf', 'application/pdf')
    pmdk_file_upload = PmdkFileUpload.new(surat_rekomendasi: image,
                          nilai_rapor: image, sertifikat: image, user_id: users(:michael).id)
    assert pmdk_file_upload.save
    assert pmdk_file_upload.valid?
    assert_equal 1, PmdkFileUpload.count
  end

end

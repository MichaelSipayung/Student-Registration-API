require "test_helper"

class ParentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create parents data' do
    assert_difference 'Parent.count' do
      post parents_path, params: { parent: {
        nama_ayah: 'luhut', nama_ibu: 'dinar', nik_ayah: 1_234_567_890_121_345, nik_ibu: 1_234_567_890_123_415,
        pendidikan_ayah: 'sma', pendidikan_ibu: 'slta', tanggal_lahir_ayah: '2020-12-11',
        tanggal_lahir_ibu: '2013-12-10', pekerjaan_ayah: 'buruh', pekerjaan_ibu: 'guru'
      } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
    assert_not_nil  Parent.find_by_nama_ayah('luhut')
    assert_not_nil  Parent.find_by_nama_ibu('dinar')
    assert_not_nil Parent.find_by_nik_ayah 1_234_567_890_121_345
    assert_not_nil Parent.find_by_nik_ibu 1_234_567_890_123_415
  end

  test 'should update parents data' do
    post auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    patch parent_path(parents(:one)), params: { parent: {
      nama_ayah: 'daniel', nama_ibu: 'nisa', nik_ayah: 1_234_567_890_121_345, nik_ibu: 1_234_567_890_123_415,
      pendidikan_ayah: 'sma', pendidikan_ibu: 'slta', tanggal_lahir_ayah: '2020-12-11',
      tanggal_lahir_ibu: '2013-12-10', pekerjaan_ayah: 'Tentara', pekerjaan_ibu: 'guru sd'
    } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    assert_equal 'daniel', parents(:one).reload.nama_ayah
    assert_equal 'nisa', parents(:one).reload.nama_ibu
    assert_equal 'Tentara', parents(:one).reload.pekerjaan_ayah
    assert_equal 'guru sd', parents(:one).reload.pekerjaan_ibu
  end

  test 'should show parents information' do
    post auth_login_url, params: {
      email: users(:nina).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
    get parent_url(parents(:one)), headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end

end

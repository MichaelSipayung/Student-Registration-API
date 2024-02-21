require 'swagger_helper'

RSpec.describe 'api/v1/pmdk_file_uploads', type: :request, rswag: true do

  path '/api/v1/pmdk_file_uploads' do

    post('create pmdk_file_upload') do
      tags 'Pmdk file upload endpoint'
      response(200, 'successful') do

        consumes 'multipart/form-data'
        parameter name: :pmdk_file_upload, in: :formData, schema: {
          type: :object,
          properties: {
            sertifikat: {type: :string, format: :binary, description: 'Upload sertifikat'},
            nilai_rapor: {type: :string, format: :binary, description: 'Upload nilai rapor'},
            surat_rekomendasi: {type: :string, format: :binary, description: 'Upload surat rekomendasi'},
          }, required: %w[sertifikat surat_rekomendasi nilai_rapor]
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/pmdk_file_uploads/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'
    get('show pmdk_file_upload') do
      tags 'Pmdk file upload endpoint'
      response(200, 'successful') do
        let(:id) { '123' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
    patch('update pmdk_file_upload') do
      tags 'Pmdk file upload endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'multipart/form-data'
        parameter name: :pmdk_file_upload, in: :formData, schema: {
          type: :object,
          properties: {
            sertifikat: {type: :string, format: :binary, description: 'Upload sertifikat'},
            nilai_rapor: {type: :string, format: :binary, description: 'Upload nilai rapor'},
            surat_rekomendasi: {type: :string, format: :binary, description: 'Upload surat rekomendasi'},
          },
          #required: %w[sertifikat surat_rekomendasi nilai_rapor]
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update pmdk_file_upload') do
      tags 'Pmdk file upload endpoint'
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'multipart/form-data'
        parameter name: :pmdk_file_upload, in: :formData, schema: {
          type: :object,
          properties: {
            sertifikat: {type: :string, format: :binary, description: 'Upload sertifikat'},
            nilai_rapor: {type: :string, format: :binary, description: 'Upload nilai rapor'},
            surat_rekomendasi: {type: :string, format: :binary, description: 'Upload surat rekomendasi'},
          },
          #required: %w[sertifikat surat_rekomendasi nilai_rapor]
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end

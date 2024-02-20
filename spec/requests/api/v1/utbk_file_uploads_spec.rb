require 'swagger_helper'

RSpec.describe 'api/v1/utbk_file_uploads', type: :request do

  # show utbk file upload
  path '/api/v1/utbk_file_uploads/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'
    get('show utbk_file_upload') do
      tags 'UTBK file upload endpoint'
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
  end
  
  path '/api/v1/utbk_file_uploads' do

    post('create utbk_file_upload') do
      tags 'UTBK file upload endpoint'
      response(200, 'successful') do
        consumes 'multipart/form-data'
        parameter name: :utbk_file_upload, in: :formData, schema: {
          type: :object,
          properties: {
            sertifikat_utbk: {type: :string, format: :binary, description: 'Upload sertifikat UTBK'}
          }, required: %w[sertifikat_utbk]
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

  path '/api/v1/utbk_file_uploads/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    patch('update utbk_file_upload') do
      tags 'UTBK file upload endpoint'
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'multipart/form-data'
        parameter name: :utbk_file_upload, in: :formData, schema: {
          type: :object,
          properties: {
            sertifikat_utbk: {type: :string, format: :binary, description: 'Upload sertifikat UTBK'}
          },
          # required: %w[sertifikat_utbk]
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

    put('update utbk_file_upload') do
      tags 'UTBK file upload endpoint'
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'multipart/form-data'
        parameter name: :utbk_file_upload, in: :formData, schema: {
          type: :object,
          properties: {
            sertifikat_utbk: {type: :string, format: :binary, description: 'Upload sertifikat UTBK'}
          },
          # required: %w[sertifikat_utbk]
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

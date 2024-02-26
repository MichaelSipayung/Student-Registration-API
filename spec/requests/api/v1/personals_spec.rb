require 'swagger_helper'

RSpec.describe 'api/v1/personals', type: :request do

  path '/api/v1/personals' do

    post('create personal') do
      tags 'Personal endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :personal, in: :body, schema: {
          type: :object,
          properties: {
            personal: {
              type: :object,
              properties: {
                nama_lengkap: { type: :string, minLength: 4, maxLength: 25,
                  example: 'John Doe'},
                agama: { type: :string, minLength: 4, maxLength: 20,
                  example: 'Islam'},
                nik: { type: :integer, minimum: 1111111111111111, maximum: 9999999999999999,
                  example: 1234567890123456 },
                nisn: { type: :integer, minimum: 1111111111, maximum: 9999999999,
                  example: 1234567890 },
                no_kps: { type: :integer, minimum: 111111, maximum: 999999,
                  example: 123456 },
                tanggal_lahir: { type: :string, minLength: 4, maxLength: 20,
                  example: '1990-01-01' },
                tempat_lahir: { type: :string, minLength: 4, maxLength: 20,
                  example: 'Jakarta' },
                jenis_kelamin: { type: :string, minLength: 4, maxLength: 20,
                  example: 'Laki-laki' },
                domisili: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Jakarta'},
              },
              required: %w[nama_lengkap agama nik nisn tanggal_lahir tempat_lahir jenis_kelamin
                      domisili]
            }
          }
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

  path '/api/v1/personals/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show personal') do
      tags 'Personal endpoint'

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

    patch('update personal') do
      tags 'Personal endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :personal, in: :body, schema: {
          type: :object,
          properties: {
            personal: {
              type: :object,
              properties: {
                nama_lengkap: { type: :string, minLength: 4, maxLength: 25,
                  example: 'John Doe'},
                agama: { type: :string, minLength: 4, maxLength: 20,
                  example: 'Islam'},
                nik: { type: :integer, minimum: 1111111111111111, maximum: 9999999999999999,
                  example: 1234567890123456 },
                nisn: { type: :integer, minimum: 1111111111, maximum: 9999999999,
                  example: 1234567890 },
                no_kps: { type: :integer, minimum: 111111, maximum: 999999,
                  example: 123456 },
                tanggal_lahir: { type: :string, minLength: 4, maxLength: 20,
                  example: '1990-01-01' },
                tempat_lahir: { type: :string, minLength: 4, maxLength: 20,
                  example: 'Jakarta' },
                jenis_kelamin: { type: :string, minLength: 4, maxLength: 20,
                  example: 'Laki-laki' },
                domisili: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Jakarta'},
              },
              # required: %w[nama_lengkap agama nik nisn tanggal_lahir tempat_lahir jenis_kelamin
              #         domisili]
            }
          }
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

    put('update personal') do
      tags 'Personal endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :personal, in: :body, schema: {
          type: :object,
          properties: {
            personal: {
              type: :object,
              properties: {
                nama_lengkap: { type: :string, minLength: 4, maxLength: 25,
                  example: 'John Doe'},
                agama: { type: :string, minLength: 4, maxLength: 20,
                  example: 'Islam'},
                nik: { type: :integer, minimum: 1111111111111111, maximum: 9999999999999999,
                  example: 1234567890123456 },
                nisn: { type: :integer, minimum: 1111111111, maximum: 9999999999,
                  example: 1234567890 },
                no_kps: { type: :integer, minimum: 111111, maximum: 999999,
                  example: 123456 },
                tanggal_lahir: { type: :string, minLength: 4, maxLength: 20,
                  example: '1990-01-01' },
                tempat_lahir: { type: :string, minLength: 4, maxLength: 20,
                  example: 'Jakarta' },
                jenis_kelamin: { type: :string, minLength: 4, maxLength: 20,
                  example: 'Laki-laki' },
                domisili: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Jakarta'},
              },
              # required: %w[nama_lengkap agama nik nisn tanggal_lahir tempat_lahir jenis_kelamin
              #         domisili]
            }
          }
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

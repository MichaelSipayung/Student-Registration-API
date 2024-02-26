require 'swagger_helper'

RSpec.describe 'api/v1/parents', type: :request do

  path '/api/v1/parents' do

    post('create parent') do
      tags 'Parent endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :parent, in: :body, schema: {
          type: :object,
          properties: {
            parent: {
              type: :object,
              properties: {
                nama_ayah: { type: :string, minLength: 4, maxLength: 25,
                  example: 'Budi'},
                nama_ibu: { type: :string, minLength: 4, maxLength: 25,
                  example: 'Siti'},
                nik_ayah: { type: :integer, minimum: 1111111111111111, maxLength: 9999999999999999,
                  example: 1234567890123456 },
                nik_ibu: { type: :integer, minimum: 1111111111111111, maxLength: 9999999999999999,
                  example: 1234567890123456 },
                pendidikan_ayah: { type: :string, minLength: 2, maxLength: 20,
                  example: 'Sarjana'},
                pendidikan_ibu: { type: :string, minLength: 2, maxLength: 20,
                  example: 'Sarjana' },
                tanggal_lahir_ayah: { type: :string, minLength: 4, maxLength: 20,
                  example: '1990-01-01' },
                tanggal_lahir_ibu: { type: :string, minLength: 4, maxLength: 20,
                  example: '1990-01-01' },
                pekerjaan_ayah: { type: :string, minLength: 3, maxLength: 20,
                  example: 'PNS'},
                pekerjaan_ibu: { type: :string, minLength: 3, maxLength: 20,
                  example: 'PNS'},

              },
              required: %w[nama_ayah nama_ibu pendidikan_ayah pendidikan_ibu
                       tanggal_lahir_ayah tanggal_lahir_ibu pekerjaan_ayah pekerjaan_ibu]
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

  path '/api/v1/parents/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show parent') do
      tags 'Parent endpoint'

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

    patch('update parent') do
      tags 'Parent endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :parent, in: :body, schema: {
          type: :object,
          properties: {
            parent: {
              type: :object,
              properties: {
                nama_ayah: { type: :string, minLength: 4, maxLength: 25,
                  example: 'Budi'},
                nama_ibu: { type: :string, minLength: 4, maxLength: 25,
                  example: 'Siti'},
                nik_ayah: { type: :integer, minimum: 1111111111111111, maxLength: 9999999999999999,
                  example: 1234567890123456 },
                nik_ibu: { type: :integer, minimum: 1111111111111111, maxLength: 9999999999999999,
                  example: 1234567890123456 },
                pendidikan_ayah: { type: :string, minLength: 2, maxLength: 20,
                  example: 'Sarjana'},
                pendidikan_ibu: { type: :string, minLength: 2, maxLength: 20,
                  example: 'Sarjana' },
                tanggal_lahir_ayah: { type: :string, minLength: 4, maxLength: 20,
                  example: '1990-01-01' },
                tanggal_lahir_ibu: { type: :string, minLength: 4, maxLength: 20,
                  example: '1990-01-01' },
                pekerjaan_ayah: { type: :string, minLength: 3, maxLength: 20,
                  example: 'PNS'},
                pekerjaan_ibu: { type: :string, minLength: 3, maxLength: 20,
                  example: 'PNS'},

              },
              # required: %w[nama_ayah nama_ibu pendidikan_ayah pendidikan_ibu
              #          tanggal_lahir_ayah tanggal_lahir_ibu pekerjaan_ayah pekerjaan_ibu]
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

    put('update parent') do
      tags 'Parent endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :parent, in: :body, schema: {
          type: :object,
          properties: {
            parent: {
              type: :object,
              properties: {
                nama_ayah: { type: :string, minLength: 4, maxLength: 25,
                  example: 'Budi'},
                nama_ibu: { type: :string, minLength: 4, maxLength: 25,
                  example: 'Siti'},
                nik_ayah: { type: :integer, minimum: 1111111111111111, maxLength: 9999999999999999,
                  example: 1234567890123456 },
                nik_ibu: { type: :integer, minimum: 1111111111111111, maxLength: 9999999999999999,
                  example: 1234567890123456 },
                pendidikan_ayah: { type: :string, minLength: 2, maxLength: 20,
                  example: 'Sarjana'},
                pendidikan_ibu: { type: :string, minLength: 2, maxLength: 20,
                  example: 'Sarjana' },
                tanggal_lahir_ayah: { type: :string, minLength: 4, maxLength: 20,
                  example: '1990-01-01' },
                tanggal_lahir_ibu: { type: :string, minLength: 4, maxLength: 20,
                  example: '1990-01-01' },
                pekerjaan_ayah: { type: :string, minLength: 3, maxLength: 20,
                  example: 'PNS'},
                pekerjaan_ibu: { type: :string, minLength: 3, maxLength: 20,
                  example: 'PNS'},

              },
              # required: %w[nama_ayah nama_ibu pendidikan_ayah pendidikan_ibu
              #          tanggal_lahir_ayah tanggal_lahir_ibu pekerjaan_ayah pekerjaan_ibu]
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

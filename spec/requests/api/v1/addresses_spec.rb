require 'swagger_helper'

RSpec.describe 'api/v1/addresses', type: :request do

  path '/api/v1/addresses' do

    post('create address') do
      tags 'Address endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        # parameter name: :Authorization, in: :header, type: :string, description: 'Authorization token'
        parameter name: :address, in: :body, schema: {
          type: :object,
          properties: {
            address: {
              type: :object,
              properties: {
                alamat: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Jl. Cibiru No. 123'},
                kelurahan: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Cibiru'},
                kecamatan: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Cibiru'},
                kode_pos: { type: :integer, minimum: 5, maximum: 5,
                  example: 40525},
                provinsi: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Jawa Barat'},
                no_telepon: { type: :integer, minimum: 10, maximum: 13,
                  example: 82272168956},
                kabupaten: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Bandung'},
              },
              required: %w[alamat kelurahan kecamatan kode_pos provinsi no_telepon kabupaten]
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

  path '/api/v1/addresses/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show address') do
      tags 'Address endpoint'

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

    patch('update address') do
      tags 'Address endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :address, in: :body, schema: {
          type: :object,
          properties: {
            address: {
              type: :object,
              properties: {
                alamat: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Jl. Cibiru No. 123'},
                kelurahan: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Cibiru'},
                kecamatan: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Cibiru'},
                kode_pos: { type: :integer, minimum: 5, maximum: 5,
                  example: 40525},
                provinsi: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Jawa Barat'},
                no_telepon: { type: :integer, minimum: 10, maximum: 13,
                  example: 82272168956},
                kabupaten: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Bandung'},
              },
              # required: %w[alamat kelurahan kecamatan kode_pos provinsi no_telepon kabupaten]
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

    put('update address') do
      tags 'Address endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :address, in: :body, schema: {
          type: :object,
          properties: {
            address: {
              type: :object,
              properties: {
                alamat: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Jl. Cibiru No. 123'},
                kelurahan: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Cibiru'},
                kecamatan: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Cibiru'},
                kode_pos: { type: :integer, minimum: 5, maximum: 5,
                  example: 40525},
                provinsi: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Jawa Barat'},
                no_telepon: { type: :integer, minimum: 10, maximum: 13,
                  example: 82272168956},
                kabupaten: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Bandung'},
              },
              # required: %w[alamat kelurahan kecamatan kode_pos provinsi no_telepon kabupaten]
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

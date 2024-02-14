require 'swagger_helper'

RSpec.describe 'api/v1/address_kecamatan_lists', type: :request do

  path '/api/v1/address_kecamatan_lists' do

    post('create address_kecamatan_list') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :address_kecamatan_list, in: :body, schema: {
          type: :object,
          properties: {
            kecamatan: {type: :string, minLength: 3, maxLength: 35},
            address_kabupaten_list_id: {type: :integer},
          },
          required: %w[kecamatan address_kabupaten_list_id]
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

  path '/api/v1/address_kecamatan_lists/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show address_kecamatan_list') do
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

    patch('update address_kecamatan_list') do
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :address_kecamatan_list, in: :body, schema: {
          type: :object,
          properties: {
            kecamatan: {type: :string, minLength: 3, maxLength: 35},
            address_kabupaten_list_id: {type: :integer},
          },
          # required: %w[kecamatan address_kabupaten_list_id]
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

    put('update address_kecamatan_list') do
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :address_kecamatan_list, in: :body, schema: {
          type: :object,
          properties: {
            kecamatan: {type: :string, minLength: 3, maxLength: 35},
            address_kabupaten_list_id: {type: :integer},
          },
          # required: %w[kecamatan address_kabupaten_list_id]
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

    delete('delete address_kecamatan_list') do
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
end

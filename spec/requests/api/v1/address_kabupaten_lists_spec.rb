require 'swagger_helper'

RSpec.describe 'api/v1/address_kabupaten_lists', type: :request do

  path '/api/v1/address_kabupaten_lists' do
    get('show all address_kabupaten_lists') do
      tags 'Address kabupaten list endpoint'
      response(200, 'successful') do

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

    post('create address_kabupaten_list') do
      tags 'Address kabupaten list endpoint'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :address_kabupaten_list, in: :body, schema: {
          type: :object,
          properties: {
            address_kabupaten_list: {
              type: :object,
              properties: {
                kabupaten: { type: :string, minLength: 3, maxLength: 35,
                  example: 'Bandung'},
                address_province_list_id: { type: :integer, example: 1},
              },
              required: %w[kabupaten address_province_list_id]
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

  path '/api/v1/address_kabupaten_lists/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show address_kabupaten_list') do
      tags 'Address kabupaten list endpoint'
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

    patch('update address_kabupaten_list') do
      tags 'Address kabupaten list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :address_kabupaten_list, in: :body, schema: {
          type: :object,
          properties: {
            address_kabupaten_list: {
              type: :object,
              properties: {
                kabupaten: { type: :string, minLength: 3, maxLength: 35,
                  example: 'Bandung'},
                address_province_list_id: { type: :integer,
                  example: 1},
              },
              # required: %w[kabupaten address_province_list_id]
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

    put('update address_kabupaten_list') do
      tags 'Address kabupaten list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :address_kabupaten_list, in: :body, schema: {
          type: :object,
          properties: {
            address_kabupaten_list: {
              type: :object,
              properties: {
                kabupaten: { type: :string, minLength: 3, maxLength: 35,
                  example: 'Bandung'},
                address_province_list_id: { type: :integer, example: 1},
              },
              # required: %w[kabupaten address_province_list_id]
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

    delete('delete address_kabupaten_list') do
      tags 'Address kabupaten list endpoint'

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

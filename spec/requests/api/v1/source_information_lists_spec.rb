require 'swagger_helper'

RSpec.describe 'api/v1/source_information_lists', type: :request do

  path '/api/v1/source_information_lists' do
    get('show all source_information_lists') do
      tags 'Source information list endpoint'
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

    post('create source_information_list') do
      tags 'Source information list endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :source_information_list, in: :body, schema: {
          type: :object,
          properties: {
            source_information_list: {
              type: :object,
              properties: {
                informasi: { type: :string, minLength: 4, maxLength: 25,
                  example: 'Kompas'},
              },
              required: %w[informasi]
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

  path '/api/v1/source_information_lists/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show source_information_list') do
      tags 'Source information list endpoint'

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

    patch('update source_information_list') do
      tags 'Source information list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :source_information_list, in: :body, schema: {
          type: :object,
          properties: {
            source_information_list: {
              type: :object,
              properties: {
                informasi: { type: :string, minLength: 4, maxLength: 25,
                  example: 'Kompas'},
              },
              # required: %w[informasi]
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

    put('update source_information_list') do
      tags 'Source information list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :source_information_list, in: :body, schema: {
          type: :object,
          properties: {
            source_information_list: {
              type: :object,
              properties: {
                informasi: { type: :string, minLength: 4, maxLength: 25,
                  example: 'Kompas'},
              },
              # required: %w[informasi]
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

    delete('delete source_information_list') do
      tags 'Source information list endpoint'

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

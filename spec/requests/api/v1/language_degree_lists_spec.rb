require 'swagger_helper'

RSpec.describe 'api/v1/language_degree_lists', type: :request do

  path '/api/v1/language_degree_lists' do

    post('create language_degree_list') do
      tags 'Language degree list endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :language_degree_list, in: :body, schema: {
          type: :object,
          properties: {
            tingkat: {type: :string, minLength: 4, maxLength: 15},
          },
          required: %w[tingkat]
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

  path '/api/v1/language_degree_lists/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show language_degree_list') do
      tags 'Language degree list endpoint'

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

    patch('update language_degree_list') do
      tags 'Language degree list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :language_degree_list, in: :body, schema: {
          type: :object,
          properties: {
            tingkat: {type: :string, minLength: 4, maxLength: 15},
          },
          # required: %w[tingkat]
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

    put('update language_degree_list') do
      tags 'Language degree list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :language_degree_list, in: :body, schema: {
          type: :object,
          properties: {
            tingkat: {type: :string, minLength: 4, maxLength: 15},
          },
          # required: %w[tingkat]
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

    delete('delete language_degree_list') do
      tags 'Language degree list endpoint'

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

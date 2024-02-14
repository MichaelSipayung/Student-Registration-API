require 'swagger_helper'

RSpec.describe 'api/v1/achievement_tingkat_lists', type: :request do

  path '/api/v1/achievement_tingkat_lists' do

    post('create achievement_tingkat_list') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :achievement_tingkat_list, in: :body, schema: {
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

  path '/api/v1/achievement_tingkat_lists/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show achievement_tingkat_list') do
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

    patch('update achievement_tingkat_list') do
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :achievement_tingkat_list, in: :body, schema: {
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

    put('update achievement_tingkat_list') do
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :achievement_tingkat_list, in: :body, schema: {
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

    delete('delete achievement_tingkat_list') do
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

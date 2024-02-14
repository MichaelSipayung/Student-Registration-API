require 'swagger_helper'

RSpec.describe 'api/v1/parent_education_lists', type: :request do

  path '/api/v1/parent_education_lists' do

    post('create parent_education_list') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :parent_education_list, in: :body, schema: {
          type: :object,
          properties: {
            pendidikan: {type: :string, minLength: 2, maxLength: 20},
          },
          required: %w[pendidikan]
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

  path '/api/v1/parent_education_lists/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show parent_education_list') do
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

    patch('update parent_education_list') do
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :parent_education_list, in: :body, schema: {
          type: :object,
          properties: {
            pendidikan: {type: :string, minLength: 2, maxLength: 20},
          },
          # required: %w[pendidikan]
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

    put('update parent_education_list') do
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :parent_education_list, in: :body, schema: {
          type: :object,
          properties: {
            pendidikan: {type: :string, minLength: 2, maxLength: 20},
          },
          # required: %w[pendidikan]
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

    delete('delete parent_education_list') do
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

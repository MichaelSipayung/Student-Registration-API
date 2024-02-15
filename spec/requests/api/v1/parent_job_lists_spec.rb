require 'swagger_helper'

RSpec.describe 'api/v1/parent_job_lists', type: :request do

  path '/api/v1/parent_job_lists' do

    post('create parent_job_list') do
      tags 'Parent job list endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :parent_job_list, in: :body, schema: {
          type: :object,
          properties: {
            pekerjaan: {type: :string, minLength: 3, maxLength: 25},
          },
          required: %w[pekerjaan]
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

  path '/api/v1/parent_job_lists/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show parent_job_list') do
      tags 'Parent job list endpoint'

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

    patch('update parent_job_list') do
      tags 'Parent job list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :parent_job_list, in: :body, schema: {
          type: :object,
          properties: {
            pekerjaan: {type: :string, minLength: 3, maxLength: 25},
          },
          # required: %w[pekerjaan]
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

    put('update parent_job_list') do
      tags 'Parent job list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :parent_job_list, in: :body, schema: {
          type: :object,
          properties: {
            pekerjaan: {type: :string, minLength: 3, maxLength: 25},
          },
          # required: %w[pekerjaan]
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

    delete('delete parent_job_list') do
      tags 'Parent job list endpoint'

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

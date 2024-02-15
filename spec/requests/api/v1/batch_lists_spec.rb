require 'swagger_helper'

RSpec.describe 'api/v1/batch_lists', type: :request do

  path '/api/v1/batch_lists' do

    post('create batch_list') do
      tags 'Batch list endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :batch_list, in: :body, schema: {
          type: :object,
          properties: {
            batch_list: {
              type: :object,
              properties: {
                gelombang: { type: :string, minLength: 4, maxLength: 25 },
                aktif: { type: :boolean },
              },
              required: %w[gelombang aktif]
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

  path '/api/v1/batch_lists/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show batch_list') do
      tags 'Batch list endpoint'

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

    patch('update batch_list') do
      tags 'Batch list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :batch_list, in: :body, schema: {
          type: :object,
          properties: {
            batch_list: {
              type: :object,
              properties: {
                gelombang: { type: :string, minLength: 4, maxLength: 25 },
                aktif: { type: :boolean },
              },
              # required: %w[gelombang aktif]
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

    put('update batch_list') do
      tags 'Batch list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :batch_list, in: :body, schema: {
          type: :object,
          properties: {
            batch_list: {
              type: :object,
              properties: {
                gelombang: { type: :string, minLength: 4, maxLength: 25 },
                aktif: { type: :boolean },
              },
              # required: %w[gelombang aktif]
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

    delete('delete batch_list') do
      tags 'Batch list endpoint'

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

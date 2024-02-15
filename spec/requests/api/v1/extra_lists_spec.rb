require 'swagger_helper'

RSpec.describe 'api/v1/extra_lists', type: :request do

  path '/api/v1/extra_lists' do

    post('create extra_list') do
      tags 'Extra list endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :extra_list, in: :body, schema: {
          type: :object,
          properties: {
            extra_list: {
              type: :object,
              properties: {
                predikat: { type: :string, minLength: 4, maxLength: 15 },
              },
              required: %w[predikat]
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

  path '/api/v1/extra_lists/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show extra_list') do
      tags 'Extra list endpoint'

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

    patch('update extra_list') do
      tags 'Extra list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :extra_list, in: :body, schema: {
          type: :object,
          properties: {
            extra_list: {
              type: :object,
              properties: {
                predikat: { type: :string, minLength: 4, maxLength: 15 },
              },
              # required: %w[predikat]
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

    put('update extra_list') do
      tags 'Extra list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :extra_list, in: :body, schema: {
          type: :object,
          properties: {
            extra_list: {
              type: :object,
              properties: {
                predikat: { type: :string, minLength: 4, maxLength: 15 },
              },
              # required: %w[predikat]
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

    delete('delete extra_list') do
      tags 'Extra list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :extra_list, in: :body, schema: {
          type: :object,
          properties: {
            predikat: { type: :string, minLength: 4, maxLength: 15 },
          },
          # required: %w[predikat]
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

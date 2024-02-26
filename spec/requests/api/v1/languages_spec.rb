require 'swagger_helper'

RSpec.describe 'api/v1/languages', type: :request do

  path '/api/v1/languages' do

    post('create language') do
      tags 'Language endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :language, in: :body, schema: {
          type: :object,
          properties: {
            language: {
              type: :object,
              properties: {
                nama_bahasa: { type: :string, minLength: 4, maxLength: 20,
                  example: 'Bahasa Indonesia' },
                tingkat: { type: :string, minLength: 4, maxLength: 20,
                  example: 'Pemula'},
              },
              required: %w[nama_bahasa tingkat]
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

  path '/api/v1/languages/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show language') do
      tags 'Language endpoint'

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

    patch('update language') do
      tags 'Language endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :language, in: :body, schema: {
          type: :object,
          properties: {
            language: {
              type: :object,
              properties: {
                nama_bahasa: { type: :string, minLength: 4, maxLength: 20,
                  example: 'Bahasa Indonesia'},
                tingkat: { type: :string, minLength: 4, maxLength: 20,
                  example: 'Pemula'},
              },
              # required: %w[nama_bahasa tingkat]
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

    put('update language') do
      tags 'Language endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :language, in: :body, schema: {
          type: :object,
          properties: {
            language: {
              type: :object,
              properties: {
                nama_bahasa: { type: :string, minLength: 4, maxLength: 20,
                  example: 'Bahasa Indonesia'},
                tingkat: { type: :string, minLength: 4, maxLength: 20,
                  example: 'Pemula'},
              },
              # required: %w[nama_bahasa tingkat]
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

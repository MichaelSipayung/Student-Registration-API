require 'swagger_helper'

RSpec.describe 'api/v1/language_name_lists', type: :request do

  path '/api/v1/language_name_lists' do
    get('show all language_name_lists') do
      tags 'Language name list endpoint'
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

    post('create language_name_list') do
      tags 'Language name list endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :language_name_list, in: :body, schema: {
          type: :object,
          properties: {
            language_name_list: {
              type: :object,
              properties: {
                bahasa: { type: :string, minLength: 4, maxLength: 15,
                  example: 'Bahasa Indonesia'},
              },
              required: %w[bahasa]
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

  path '/api/v1/language_name_lists/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show language_name_list') do
      tags 'Language name list endpoint'

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

    patch('update language_name_list') do
      tags 'Language name list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :language_name_list, in: :body, schema: {
          type: :object,
          properties: {
            language_name_list: {
              type: :object,
              properties: {
                bahasa: { type: :string, minLength: 4, maxLength: 15,
                  example: 'Bahasa Indonesia'},
              },
              # required: %w[bahasa]
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

    put('update language_name_list') do
      tags 'Language name list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :language_name_list, in: :body, schema: {
          type: :object,
          properties: {
            language_name_list: {
              type: :object,
              properties: {
                bahasa: { type: :string, minLength: 4, maxLength: 15,
                  example: 'Bahasa Indonesia'},
              },
              # required: %w[bahasa]
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

    delete('delete language_name_list') do
      tags 'Language name list endpoint'

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

require 'swagger_helper'

RSpec.describe 'api/v1/personal_gender_lists', type: :request do

  path '/api/v1/personal_gender_lists' do
    get('show all personal_gender_lists') do
      tags 'Personal gender list endpoint'
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

    post('create personal_gender_list') do
      tags 'Personal gender list endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :personal_gender_list, in: :body, schema: {
          type: :object,
          properties: {
            personal_gender_list: {
              type: :object,
              properties: {
                jenis_kelamin: { type: :string, minLength: 4, maxLength: 10,
                  example: 'Laki-laki'},
              },
              required: %w[jenis_kelamin]
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

  path '/api/v1/personal_gender_lists/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show personal_gender_list') do
      tags 'Personal gender list endpoint'

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

    patch('update personal_gender_list') do
      tags 'Personal gender list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :personal_gender_list, in: :body, schema: {
          type: :object,
          properties: {
            personal_gender_list: {
              type: :object,
              properties: {
                jenis_kelamin: { type: :string, minLength: 4, maxLength: 10,
                  example: 'Laki-laki'},
              },
              # required: %w[jenis_kelamin]
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

    put('update personal_gender_list') do
      tags 'Personal gender list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :personal_gender_list, in: :body, schema: {
          type: :object,
          properties: {
            personal_gender_list: {
              type: :object,
              properties: {
                jenis_kelamin: { type: :string, minLength: 4, maxLength: 10,
                  example: 'Laki-laki'},
              },
              # required: %w[jenis_kelamin]
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

    delete('delete personal_gender_list') do
      tags 'Personal gender list endpoint'

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

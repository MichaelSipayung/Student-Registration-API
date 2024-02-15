require 'swagger_helper'

RSpec.describe 'api/v1/high_school_major_lists', type: :request do

  path '/api/v1/high_school_major_lists' do

    post('create high_school_major_list') do
      tags 'High school major list endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :high_school_major, in: :body, schema: {
          type: :object,
          properties: {
            jurusan: {type: :string, minLength: 3, maxLength: 25},
          },
          required: %w[jurusan]
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

  path '/api/v1/high_school_major_lists/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show high_school_major_list') do
      tags 'High school major list endpoint'

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

    patch('update high_school_major_list') do
      tags 'High school major list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :high_school_major, in: :body, schema: {
          type: :object,
          properties: {
            jurusan: {type: :string, minLength: 3, maxLength: 25},
          },
          # required: %w[jurusan]
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

    put('update high_school_major_list') do
      tags 'High school major list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :high_school_major, in: :body, schema: {
          type: :object,
          properties: {
            jurusan: {type: :string, minLength: 3, maxLength: 25},
          },
          # required: %w[jurusan]
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

    delete('delete high_school_major_list') do
      tags 'High school major list endpoint'

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

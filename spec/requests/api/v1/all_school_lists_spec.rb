require 'swagger_helper'

RSpec.describe 'api/v1/all_school_lists', type: :request do

  path '/api/v1/all_school_lists' do

    post('create all_school_list') do
      tags 'All school list endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :all_school_list, in: :body, schema: {
          type: :object,
          properties: {
            sekolah: {type: :string, minLength: 5, maxLength: 35},
          },
          required: %w[sekolah]
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

  path '/api/v1/all_school_lists/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show all_school_list') do
      tags 'All school list endpoint'

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

    patch('update all_school_list') do
      tags 'All school list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :all_school_list, in: :body, schema: {
          type: :object,
          properties: {
            sekolah: {type: :string, minLength: 5, maxLength: 35},
          },
          # required: %w[sekolah]
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

    put('update all_school_list') do
      tags 'All school list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :all_school_list, in: :body, schema: {
          type: :object,
          properties: {
            sekolah: {type: :string, minLength: 5, maxLength: 35},
          },
          # required: %w[sekolah]
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

    delete('delete all_school_list') do
      tags 'All school list endpoint'

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

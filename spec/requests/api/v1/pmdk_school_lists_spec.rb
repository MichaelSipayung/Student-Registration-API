require 'swagger_helper'

RSpec.describe 'api/v1/pmdk_school_lists', type: :request do

  path '/api/v1/pmdk_school_lists' do
    get('show all pmdk_school_lists') do
      tags 'Pmdk school list endpoint'
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

    post('create pmdk_school_list') do
      tags 'Pmdk school list endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :pmdk_school_list, in: :body, schema: {
          type: :object,
          properties: {
            pmdk_school_list: {
              type: :object,
              properties: {
                sekolah: { type: :string, minLength: 5, maximum: 35 },
              },
              required: %w[sekolah]
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

  path '/api/v1/pmdk_school_lists/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show pmdk_school_list') do
      tags 'Pmdk school list endpoint'

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

    patch('update pmdk_school_list') do
      tags 'Pmdk school list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :pmdk_school_list, in: :body, schema: {
          type: :object,
          properties: {
            pmdk_school_list: {
              type: :object,
              properties: {
                sekolah: { type: :string, minLength: 5, maximum: 35 },
              },
              # required: %w[sekolah]
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

    put('update pmdk_school_list') do
      tags 'Pmdk school list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :pmdk_school_list, in: :body, schema: {
          type: :object,
          properties: {
            pmdk_school_list: {
              type: :object,
              properties: {
                sekolah: { type: :string, minLength: 5, maximum: 35 },
              },
              # required: %w[sekolah]
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

    delete('delete pmdk_school_list') do
      tags 'Pmdk school list endpoint'

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

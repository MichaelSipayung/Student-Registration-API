require 'swagger_helper'

RSpec.describe 'api/v1/organization_degree_lists', type: :request do

  path '/api/v1/organization_degree_lists' do
    get('show all organization_degree_lists') do
      tags 'Organization degree list endpoint'
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

    post('create organization_degree_list') do
      tags 'Organization degree list endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :organization_degree_list, in: :body, schema: {
          type: :object,
          properties: {
            organization_degree_list: {
              type: :object,
              properties: {
                jabatan: { type: :string, minLength: 3, maxLength: 15,
                  example: 'Ketua'},
              },
              required: %w[jabatan]
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

  path '/api/v1/organization_degree_lists/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show organization_degree_list') do
      tags 'Organization degree list endpoint'

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

    patch('update organization_degree_list') do
      tags 'Organization degree list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :organization_degree_list, in: :body, schema: {
          type: :object,
          properties: {
            organization_degree_list: {
              type: :object,
              properties: {
                jabatan: { type: :string, minLength: 3, maxLength: 15,
                  example: 'Ketua'},
              },
              # required: %w[jabatan]
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

    put('update organization_degree_list') do
      tags 'Organization degree list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :organization_degree_list, in: :body, schema: {
          type: :object,
          properties: {
            organization_degree_list: {
              type: :object,
              properties: {
                jabatan: { type: :string, minLength: 3, maxLength: 15,
                  example: 'Ketua'},
              },
              # required: %w[jabatan]
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

    delete('delete organization_degree_list') do
      tags 'Organization degree list endpoint'

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

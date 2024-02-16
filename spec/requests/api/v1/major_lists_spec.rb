require 'swagger_helper'

RSpec.describe 'api/v1/major_lists', type: :request do

  path '/api/v1/major_lists' do
    get('show all major_lists') do
      tags 'Major list endpoint'
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

    post('create major_list') do
      tags 'Major list endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :major_list, in: :body, schema: {
          type: :object,
          properties: {
            major_list: {
              type: :object,
              properties: {
                jurusan: { type: :string, minLength: 4, maxLength: 30 },
              },
              required: %w[jurusan]
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

  path '/api/v1/major_lists/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show major_list') do
      tags 'Major list endpoint'

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

    patch('update major_list') do
      tags 'Major list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :major_list, in: :body, schema: {
          type: :object,
          properties: {
            major_list: {
              type: :object,
              properties: {
                jurusan: { type: :string, minLength: 4, maxLength: 30 },
              },
              # required: %w[jurusan]
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

    put('update major_list') do
      tags 'Major list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :major_list, in: :body, schema: {
          type: :object,
          properties: {
            major_list: {
              type: :object,
              properties: {
                jurusan: { type: :string, minLength: 4, maxLength: 30 },
              },
              # required: %w[jurusan]
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

    delete('delete major_list') do
      tags 'Major list endpoint'

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

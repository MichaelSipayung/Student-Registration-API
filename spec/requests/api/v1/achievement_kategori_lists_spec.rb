require 'swagger_helper'

RSpec.describe 'api/v1/achievement_kategori_lists', type: :request do

  path '/api/v1/achievement_kategori_lists' do
    get('show all achievement kategori lists') do
      tags 'Achievement category list endpoint'
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

    post('create achievement_kategori_list') do
      tags 'Achievement category list endpoint'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :achievement_kategori_list, in: :body, schema: {
          type: :object,
          properties: {
            achievement_kategori_list: {
              type: :object,
              properties: {
                kategori: { type: :string, minLength: 4, maxLength: 15 },
              },
              required: %w[kategori]
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

  path '/api/v1/achievement_kategori_lists/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show achievement_kategori_list') do
      tags 'Achievement category list endpoint'
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

    patch('update achievement_kategori_list') do
      tags 'Achievement category list endpoint'
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :achievement_kategori_list, in: :body, schema: {
          type: :object,
          properties: {
            achievement_kategori_list: {
              type: :object,
              properties: {
                kategori: { type: :string, minLength: 4, maxLength: 15 },
              },
              # required: %w[kategori]
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

    put('update achievement_kategori_list') do
      tags 'Achievement category list endpoint'
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :achievement_kategori_list, in: :body, schema: {
          type: :object,
          properties: {
            achievement_kategori_list: {
              type: :object,
              properties: {
                kategori: { type: :string, minLength: 4, maxLength: 15 },
              },
              # required: %w[kategori]
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

    delete('delete achievement_kategori_list') do
      tags 'Achievement category list endpoint'
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

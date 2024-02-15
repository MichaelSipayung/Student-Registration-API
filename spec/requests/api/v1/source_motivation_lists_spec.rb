require 'swagger_helper'

RSpec.describe 'api/v1/source_motivation_lists', type: :request do

  path '/api/v1/source_motivation_lists' do

    post('create source_motivation_list') do
      tags 'Source motivation list endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :source_motivation_list, in: :body, schema: {
          type: :object,
          properties: {
            source_motivation_list: {
              type: :object,
              properties: {
                motivasi: { type: :string, minLength: 4, maxLength: 20 },
              },
              required: %w[motivasi]
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

  path '/api/v1/source_motivation_lists/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show source_motivation_list') do
      tags 'Source motivation list endpoint'

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

    patch('update source_motivation_list') do
      tags 'Source motivation list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :source_motivation_list, in: :body, schema: {
          type: :object,
          properties: {
            source_motivation_list: {
              type: :object,
              properties: {
                motivasi: { type: :string, minLength: 4, maxLength: 20 },
              },
              # required: %w[motivasi]
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

    put('update source_motivation_list') do
      tags 'Source motivation list endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :source_motivation_list, in: :body, schema: {
          type: :object,
          properties: {
            source_motivation_list: {
              type: :object,
              properties: {
                motivasi: { type: :string, minLength: 4, maxLength: 20 },
              },
              # required: %w[motivasi]
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

    delete('delete source_motivation_list') do
      tags 'Source motivation list endpoint'

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

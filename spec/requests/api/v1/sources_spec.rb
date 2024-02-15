require 'swagger_helper'

RSpec.describe 'api/v1/sources', type: :request do

  path '/api/v1/sources' do

    post('create source') do
      tags 'Source endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :source, in: :body, schema: {
          type: :object,
          properties: {
            source: {
              type: :object,
              properties: {
                sumber_informasi: { type: :string, minLength: 4, maxLength: 30 },
                motivasi: { type: :string, minLength: 4, maxLength: 30 },
                jumlah_n: { type: :integer, minimum: 1, maximum: 50 },
              },
              required: %w[sumber_informasi motivasi jumlah_n]
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

  path '/api/v1/sources/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show source') do
      tags 'Source endpoint'

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

    patch('update source') do
      tags 'Source endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :source, in: :body, schema: {
          type: :object,
          properties: {
            source: {
              type: :object,
              properties: {
                sumber_informasi: { type: :string, minLength: 4, maxLength: 30 },
                motivasi: { type: :string, minLength: 4, maxLength: 30 },
                jumlah_n: { type: :integer, minimum: 1, maximum: 50 },
              },
              # required: %w[sumber_informasi motivasi jumlah_n]
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

    put('update source') do
      tags 'Source endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :source, in: :body, schema: {
          type: :object,
          properties: {
            source: {
              type: :object,
              properties: {
                sumber_informasi: { type: :string, minLength: 4, maxLength: 30 },
                motivasi: { type: :string, minLength: 4, maxLength: 30 },
                jumlah_n: { type: :integer, minimum: 1, maximum: 50 },
              },
              # required: %w[sumber_informasi motivasi jumlah_n]
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

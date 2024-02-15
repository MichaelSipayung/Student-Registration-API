require 'swagger_helper'

RSpec.describe 'api/v1/achievements', type: :request do

  path '/api/v1/achievements' do

    post('create achievement') do
      tags 'Achievement endpoint'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :achievement, in: :body, schema: {
          type: :object,
          properties: {
            nama_prestasi: {type: :string, minLength: 4, maxLength: 20},
            tingkat: {type: :string, minLength: 4, maxLength: 20},
            tahun: {type: :string, minLength: 4, maxLength: 20},
            kategori: {type: :string, minLength: 4, maxLength: 20},

          },
          required: %w[nama_prestasi tingkat tahun kategori]
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

  path '/api/v1/achievements/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show achievement') do
      tags 'Achievement endpoint'
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

    patch('update achievement') do
      tags 'Achievement endpoint'
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :achievement, in: :body, schema: {
          type: :object,
          properties: {
            nama_prestasi: {type: :string, minLength: 4, maxLength: 20},
            tingkat: {type: :string, minLength: 4, maxLength: 20},
            tahun: {type: :string, minLength: 4, maxLength: 20},
            kategori: {type: :string, minLength: 4, maxLength: 20},

          },
          # required: %w[nama_prestasi tingkat tahun kategori]
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

    put('update achievement') do
      tags 'Achievement endpoint'
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :achievement, in: :body, schema: {
          type: :object,
          properties: {
            nama_prestasi: {type: :string, minLength: 4, maxLength: 20},
            tingkat: {type: :string, minLength: 4, maxLength: 20},
            tahun: {type: :string, minLength: 4, maxLength: 20},
            kategori: {type: :string, minLength: 4, maxLength: 20},

          },
          # required: %w[nama_prestasi tingkat tahun kategori]
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

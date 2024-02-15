require 'swagger_helper'

RSpec.describe 'api/v1/organizations', type: :request do

  path '/api/v1/organizations' do

    post('create organization') do
      tags 'Organization endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :organization, in: :body, schema: {
          type: :object,
          properties: {
            nama_organisasi: {type: :string, minLength: 4, maxLength: 20},
            mulai: {type: :string, minLength: 4, maxLength: 20},
            berakhir: {type: :string, minLength: 4, maxLength: 20},
            jabatan: {type: :string, minLength: 4, maxLength: 20},

          },
          required: %w[nama_organisasi mulai berakhir jabatan ]
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

  path '/api/v1/organizations/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show organization') do
      tags 'Organization endpoint'

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

    patch('update organization') do
      tags 'Organization endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :organization, in: :body, schema: {
          type: :object,
          properties: {
            nama_organisasi: {type: :string, minLength: 4, maxLength: 20},
            mulai: {type: :string, minLength: 4, maxLength: 20},
            berakhir: {type: :string, minLength: 4, maxLength: 20},
            jabatan: {type: :string, minLength: 4, maxLength: 20},

          },
          # required: %w[nama_organisasi mulai berakhir jabatan ]
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

    put('update organization') do
      tags 'Organization endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :organization, in: :body, schema: {
          type: :object,
          properties: {
            nama_organisasi: {type: :string, minLength: 4, maxLength: 20},
            mulai: {type: :string, minLength: 4, maxLength: 20},
            berakhir: {type: :string, minLength: 4, maxLength: 20},
            jabatan: {type: :string, minLength: 4, maxLength: 20},

          },
          # required: %w[nama_organisasi mulai berakhir jabatan ]
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

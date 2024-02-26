require 'swagger_helper'

RSpec.describe 'api/v1/extras', type: :request do

  path '/api/v1/extras' do

    post('create extra') do
      tags 'Extra endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :extra, in: :body, schema: {
          type: :object,
          properties: {
            extra: {
              type: :object,
              properties: {
                nama_kegiatan: { type: :string, minLength: 4, maxLength: 20,
                  example: 'Pramuka' },
                predikat: { type: :string, minLength: 4, maxLength: 20,
                  example: 'Memuaskan' },
                mulai: { type: :string, minLength: 4, maxLength: 20,
                  example: '2021-01-01' },
                berakhir: { type: :string, minLength: 4, maxLength: 20,
                  example: '2021-10-01'},
              },
              required: %w[nama_kegiatan predikat mulai berakhir]
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

  path '/api/v1/extras/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show extra') do
      tags 'Extra endpoint'

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

    patch('update extra') do
      tags 'Extra endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :extra, in: :body, schema: {
          type: :object,
          properties: {
            extra: {
              type: :object,
              properties: {
                nama_kegiatan: { type: :string, minLength: 4, maxLength: 20,
                  example: 'Pramuka' },
                predikat: { type: :string, minLength: 4, maxLength: 20,
                  example: 'Memuaskan' },
                mulai: { type: :string, minLength: 4, maxLength: 20,
                  example: '2021-01-01' },
                berakhir: { type: :string, minLength: 4, maxLength: 20,
                  example: '2021-10-01'},
              },
              # required: %w[nama_kegiatan predikat mulai berakhir]
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

    put('update extra') do
      tags 'Extra endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :extra, in: :body, schema: {
          type: :object,
          properties: {
            extra: {
              type: :object,
              properties: {
                nama_kegiatan: { type: :string, minLength: 4, maxLength: 20,
                  example: 'Pramuka' },
                predikat: { type: :string, minLength: 4, maxLength: 20,
                  example: 'Memuaskan' },
                mulai: { type: :string, minLength: 4, maxLength: 20,
                  example: '2021-01-01' },
                berakhir: { type: :string, minLength: 4, maxLength: 20,
                  example: '2021-10-01'},
              },
              # required: %w[nama_kegiatan predikat mulai berakhir]
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

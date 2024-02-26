require 'swagger_helper'

RSpec.describe 'api/v1/majors', type: :request do

  path '/api/v1/majors' do

    post('create major') do
      tags 'Major endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :major, in: :body, schema: {
          type: :object,
          properties: {
            major: {
              type: :object,
              properties: {
                jurusan1: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Teknik Informatika'},
                jurusan2: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Sistem Informasi'},
                jurusan3: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Teknik Elektro'},
                gelombang: { type: :string, minLength: 4, maxLength: 30,
                  example: 'PMDK Sumut'},
              },
              required: %w[jurusan1 jurusan2 jurusan3 gelombang]
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

  path '/api/v1/majors/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show major') do
      tags 'Major endpoint'

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

    patch('update major') do
      tags 'Major endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :major, in: :body, schema: {
          type: :object,
          properties: {
            major: {
              type: :object,
              properties: {
                jurusan1: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Teknik Informatika'},
                jurusan2: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Sistem Informasi'},
                jurusan3: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Teknik Elektro'},
                gelombang: { type: :string, minLength: 4, maxLength: 30,
                  example: 'PMDK Sumut'},
              },
              # required: %w[jurusan1 jurusan2 jurusan3 gelombang]
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

    put('update major') do
      tags 'Major endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :major, in: :body, schema: {
          type: :object,
          properties: {
            major: {
              type: :object,
              properties: {
                jurusan1: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Teknik Informatika'},
                jurusan2: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Sistem Informasi'},
                jurusan3: { type: :string, minLength: 4, maxLength: 30,
                  example: 'Teknik Elektro'},
                gelombang: { type: :string, minLength: 4, maxLength: 30,
                  example: 'PMDK Sumut'},
              },
              # required: %w[jurusan1 jurusan2 jurusan3 gelombang]
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

require 'swagger_helper'

RSpec.describe 'api/v1/pmdk_school_informations', type: :request do

  path '/api/v1/pmdk_school_informations' do

    post('create pmdk_school_information') do
      tags 'Pmdk school information endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :pmdk_school_information, in: :body, schema: {
          type: :object,
          properties: {
            pmdk_school_information: {
              type: :object,
              properties: {
                asal_sekolah: { type: :string, minLength: 3, maxLength: 50,
                  example: 'SMPN 1 Bandung'},
                jurusan_sekolah: { type: :string, minLength: 3, maxLength: 50,
                  example: 'IPA'},
                akreditas: { type: :string, minLength: 1, maxLength: 20,
                  example: 'A'},
                jumlah_nilai_un: { type: :number, minimum: 2, maximum: 1000, example: 800 },
                jumlah_pelajaran_un: { type: :integer, minimum: 2, maximum: 10, example: 8},
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

  path '/api/v1/pmdk_school_informations/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show pmdk_school_information') do
      tags 'Pmdk school information endpoint'

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

    patch('update pmdk_school_information') do
      tags 'Pmdk school information endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :pmdk_school_information, in: :body, schema: {
          type: :object,
          properties: {
            pmdk_school_information: {
              type: :object,
              properties: {
                asal_sekolah: { type: :string, minLength: 3, maxLength: 50,
                  example: 'SMPN 1 Bandung'},
                jurusan_sekolah: { type: :string, minLength: 3, maxLength: 50,
                  example: 'IPA'},
                akreditas: { type: :string, minLength: 1, maxLength: 20,
                  example: 'A'},
                jumlah_nilai_un: { type: :number, minimum: 2, maximum: 1000, example: 800 },
                jumlah_pelajaran_un: { type: :integer, minimum: 2, maximum: 10, example: 8},
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

    put('update pmdk_school_information') do
      tags 'Pmdk school information endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :pmdk_school_information, in: :body, schema: {
          type: :object,
          properties: {
            pmdk_school_information: {
              type: :object,
              properties: {
                asal_sekolah: { type: :string, minLength: 3, maxLength: 50,
                  example: 'SMPN 1 Bandung'},
                jurusan_sekolah: { type: :string, minLength: 3, maxLength: 50,
                  example: 'IPA'},
                akreditas: { type: :string, minLength: 1, maxLength: 20,
                  example: 'A'},
                jumlah_nilai_un: { type: :number, minimum: 2, maximum: 1000, example: 800 },
                jumlah_pelajaran_un: { type: :integer, minimum: 2, maximum: 10, example: 8},
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
  end
end

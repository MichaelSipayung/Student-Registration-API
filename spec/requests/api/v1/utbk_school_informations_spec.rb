require 'swagger_helper'

RSpec.describe 'api/v1/utbk_school_informations', type: :request do

  path '/api/v1/utbk_school_informations' do

    post('create utbk_school_information') do
      tags 'Utbk school information endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :utbk_school_information, in: :body, schema: {
          type: :object,
          properties: {
            utbk_school_information: {
              type: :object,
              properties: {
                asal_sekolah: {type: :string, minLength: 3, maxLength: 50,
                  example: 'SMA 1 Bandung'},
                jurusan_sekolah: {type: :string, minLength: 3, maxLength: 50,
                  example: 'IPA'},
                akreditas: {type: :string, minLength: 1, maxLength: 20,
                  example: 'A'},
                jumlah_nilai_un: {type: :number, minimum: 2, maximum: 1000,
                  example: 800},
                jumlah_pelajaran_un: {type: :integer, minimum: 2, maximum: 10,
                  example: 8},
              },
              required: %w[asal_sekolah jurusan_sekolah akreditas]
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

  path '/api/v1/utbk_school_informations/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show utbk_school_information') do
      tags 'Utbk school information endpoint'

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

    patch('update utbk_school_information') do
      tags 'Utbk school information endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :utbk_school_information, in: :body, schema: {
          type: :object,
          properties: {
            utbk_school_information: {
              type: :object,
              properties: {
                asal_sekolah: {type: :string, minLength: 3, maxLength: 50,
                  example: 'SMA 1 Bandung'},
                jurusan_sekolah: {type: :string, minLength: 3, maxLength: 50,
                  example: 'IPA'},
                akreditas: {type: :string, minLength: 1, maxLength: 20,
                  example: 'A'},
                jumlah_nilai_un: {type: :number, minimum: 2, maximum: 1000,
                  example: 800},
                jumlah_pelajaran_un: {type: :integer, minimum: 2, maximum: 10,
                  example: 8},
              },
              required: %w[asal_sekolah jurusan_sekolah akreditas]
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

    put('update utbk_school_information') do
      tags 'Utbk school information endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :utbk_school_information, in: :body, schema: {
          type: :object,
          properties: {
            utbk_school_information: {
              type: :object,
              properties: {
                asal_sekolah: {type: :string, minLength: 3, maxLength: 50,
                  example: 'SMA 1 Bandung'},
                jurusan_sekolah: {type: :string, minLength: 3, maxLength: 50,
                  example: 'IPA'},
                akreditas: {type: :string, minLength: 1, maxLength: 20,
                  example: 'A'},
                jumlah_nilai_un: {type: :number, minimum: 2, maximum: 1000,
                  example: 800},
                jumlah_pelajaran_un: {type: :integer, minimum: 2, maximum: 10,
                  example: 8},
              },
              required: %w[asal_sekolah jurusan_sekolah akreditas]
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

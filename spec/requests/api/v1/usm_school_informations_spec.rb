require 'swagger_helper'

RSpec.describe 'api/v1/usm_school_informations', type: :request do

  path '/api/v1/usm_school_informations' do

    post('create usm_school_information') do
      tags 'Usm school information endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :usm_school_information, in: :body, schema: {
          type: :object,
          properties: {
            usm_school_information: {
              type: :object,
              properties: {
                asal_sekolah: { type: :string, minLength: 3, maxLength: 50 },
                jurusan_sekolah: { type: :string, minLength: 3, maxLength: 50 },
                akreditas: { type: :string, minLength: 1, maxLength: 20 },
                jumlah_nilai_un: { type: :number, minimum: 2, maximum: 1000 },
                jumlah_pelajaran_un: { type: :integer, minimum: 2, maximum: 10 },
                jumlah_pelajaran_semester5: { type: :integer, minimum: 2, maximum: 20 },
                jumlah_nilai_semester5: { type: :number, minimum: 2, maximum: 2000 },
              },
              required: %w[asal_sekolah jurusan_sekolah akreditas
                      jumlah_pelajaran_semester5 jumlah_nilai_semester5]
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

  path '/api/v1/usm_school_informations/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show usm_school_information') do
      tags 'Usm school information endpoint'

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

    patch('update usm_school_information') do
      tags 'Usm school information endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :usm_school_information, in: :body, schema: {
          type: :object,
          properties: {
            usm_school_information: {
              type: :object,
              properties: {
                asal_sekolah: { type: :string, minLength: 3, maxLength: 50 },
                jurusan_sekolah: { type: :string, minLength: 3, maxLength: 50 },
                akreditas: { type: :string, minLength: 1, maxLength: 20 },
                jumlah_nilai_un: { type: :number, minimum: 2, maximum: 1000 },
                jumlah_pelajaran_un: { type: :integer, minimum: 2, maximum: 10 },
                jumlah_pelajaran_semester5: { type: :integer, minimum: 2, maximum: 20 },
                jumlah_nilai_semester5: { type: :number, minimum: 2, maximum: 2000 },
              },
              # required: %w[asal_sekolah jurusan_sekolah akreditas
              #         jumlah_pelajaran_semester5 jumlah_nilai_semester5]
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

    put('update usm_school_information') do
      tags 'Usm school information endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :usm_school_information, in: :body, schema: {
          type: :object,
          properties: {
            usm_school_information: {
              type: :object,
              properties: {
                asal_sekolah: { type: :string, minLength: 3, maxLength: 50 },
                jurusan_sekolah: { type: :string, minLength: 3, maxLength: 50 },
                akreditas: { type: :string, minLength: 1, maxLength: 20 },
                jumlah_nilai_un: { type: :number, minimum: 2, maximum: 1000 },
                jumlah_pelajaran_un: { type: :integer, minimum: 2, maximum: 10 },
                jumlah_pelajaran_semester5: { type: :integer, minimum: 2, maximum: 20 },
                jumlah_nilai_semester5: { type: :number, minimum: 2, maximum: 2000 },
              },
              # required: %w[asal_sekolah jurusan_sekolah akreditas
              #         jumlah_pelajaran_semester5 jumlah_nilai_semester5]
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

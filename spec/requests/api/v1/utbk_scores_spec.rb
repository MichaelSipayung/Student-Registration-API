require 'swagger_helper'

RSpec.describe 'api/v1/utbk_scores', type: :request do

  path '/api/v1/utbk_scores' do

    post('create utbk_score') do
      tags 'Utbk score endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :utbk_score, in: :body, schema: {
          type: :object,
          properties: {
            utbk_score: {
              type: :object,
              properties: {
                no_peserta: { type: :string, minLength: 4, maxLength: 30,
                  example: '1234567890' },
                tanggal_ujian: { type: :string, minLength: 4, maxLength: 10,
                  example: '2021-01-01' },
                jumlah_nilai_semester6: { type: :number, minimum: 2, maximum: 2000,
                  example: 800 },
                jumlah_pelajaran_semester6: { type: :integer, minimum: 2, maximum: 100,
                  example: 8 },
                nilai_penalaran_umum: { type: :number, minimum: 5, maximum: 1000,
                  example: 800 },
                nilai_pengetahuan_kuantitatif: { type: :number, minimum: 5, maximum: 1000,
                  example: 800 },
                nilai_kemampuan_memahami_bacaan_dan_menulis: { type: :number, minimum: 5,
                maximum: 1000, example: 800 },
                nilai_pengetahuan_dan_pemahaman_umum: { type: :number, minimum: 5, maximum: 1000,
                  example: 800 },
              },
              required: %w[no_peserta tanggal_ujian jumlah_nilai_semester6 jumlah_pelajaran_semester6
              nilai_penalaran_umum nilai_pengetahuan_kuantitatif
              nilai_kemampuan_memahami_bacaan_dan_menulis nilai_pengetahuan_dan_pemahaman_umum]
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

  path '/api/v1/utbk_scores/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show utbk_score') do
      tags 'Utbk score endpoint'

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

    patch('update utbk_score') do
      tags 'Utbk score endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :utbk_score, in: :body, schema: {
          type: :object,
          properties: {
            utbk_score: {
              type: :object,
              properties: {
                no_peserta: { type: :string, minLength: 4, maxLength: 30,
                  example: '1234567890' },
                tanggal_ujian: { type: :string, minLength: 4, maxLength: 10,
                  example: '2021-01-01' },
                jumlah_nilai_semester6: { type: :number, minimum: 2, maximum: 2000,
                  example: 800 },
                jumlah_pelajaran_semester6: { type: :integer, minimum: 2, maximum: 100,
                  example: 8 },
                nilai_penalaran_umum: { type: :number, minimum: 5, maximum: 1000,
                  example: 800 },
                nilai_pengetahuan_kuantitatif: { type: :number, minimum: 5, maximum: 1000,
                  example: 800 },
                nilai_kemampuan_memahami_bacaan_dan_menulis: { type: :number, minimum: 5,
                maximum: 1000, example: 800 },
                nilai_pengetahuan_dan_pemahaman_umum: { type: :number, minimum: 5, maximum: 1000,
                  example: 800 },
              },
              # required: %w[no_peserta tanggal_ujian jumlah_nilai_semester6 jumlah_pelajaran_semester6
              # nilai_penalaran_umum nilai_pengetahuan_kuantitatif
              # nilai_kemampuan_memahami_bacaan_dan_menulis nilai_pengetahuan_dan_pemahaman_umum]
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

    put('update utbk_score') do
      tags 'Utbk score endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :utbk_score, in: :body, schema: {
          type: :object,
          properties: {
            utbk_score: {
              type: :object,
              properties: {
                no_peserta: { type: :string, minLength: 4, maxLength: 30,
                  example: '1234567890' },
                tanggal_ujian: { type: :string, minLength: 4, maxLength: 10,
                  example: '2021-01-01' },
                jumlah_nilai_semester6: { type: :number, minimum: 2, maximum: 2000,
                  example: 800 },
                jumlah_pelajaran_semester6: { type: :integer, minimum: 2, maximum: 100,
                  example: 8 },
                nilai_penalaran_umum: { type: :number, minimum: 5, maximum: 1000,
                  example: 800 },
                nilai_pengetahuan_kuantitatif: { type: :number, minimum: 5, maximum: 1000,
                  example: 800 },
                nilai_kemampuan_memahami_bacaan_dan_menulis: { type: :number, minimum: 5,
                maximum: 1000, example: 800 },
                nilai_pengetahuan_dan_pemahaman_umum: { type: :number, minimum: 5, maximum: 1000,
                  example: 800 },
              },
              # required: %w[no_peserta tanggal_ujian jumlah_nilai_semester6 jumlah_pelajaran_semester6
              # nilai_penalaran_umum nilai_pengetahuan_kuantitatif
              # nilai_kemampuan_memahami_bacaan_dan_menulis nilai_pengetahuan_dan_pemahaman_umum]
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

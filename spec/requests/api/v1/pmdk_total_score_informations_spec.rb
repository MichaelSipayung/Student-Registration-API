require 'swagger_helper'

RSpec.describe 'api/v1/pmdk_total_score_informations', type: :request do

  path '/api/v1/pmdk_total_score_informations' do

    post('create pmdk_total_score_information') do
      tags 'Pmdk total score information endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :pmdk_total_score_information, in: :body, schema: {
          type: :object,
          properties: {
            pmdk_total_score_information: {
              type: :object,
              properties: {
                jumlah_nilai_semester1: { type: :number, minimum: 2, maximum: 3000,
                  example: 800 },
                jumlah_nilai_semester2: { type: :number, minimum: 2, maximum: 3000,
                  example: 800 },
                jumlah_nilai_semester3: { type: :number, minimum: 2, maximum: 3000,
                  example: 800 },
                jumlah_nilai_semester4: { type: :number, minimum: 2, maximum: 3000,
                  example: 800 },
                jumlah_nilai_semester5: { type: :number, minimum: 2, maximum: 3000,
                  example: 800},
                jumlah_pelajaran_semester1: { type: :integer, minimum: 2, maximum: 30,
                  example: 8 },
                jumlah_pelajaran_semester2: { type: :integer, minimum: 2, maximum: 30,
                  example: 8 },
                jumlah_pelajaran_semester3: { type: :integer, minimum: 2, maximum: 30,
                  example: 8 },
                jumlah_pelajaran_semester4: { type: :integer, minimum: 2, maximum: 30,
                  example: 8 },
                jumlah_pelajaran_semester5: { type: :integer, minimum: 2, maximum: 30,
                  example: 8},
              },
              required: %w[jumlah_nilai_semester1 jumlah_nilai_semester2 jumlah_nilai_semester3
              jumlah_nilai_semester4 jumlah_nilai_semester5 jumlah_pelajaran_semester1
              jumlah_pelajaran_semester2 jumlah_pelajaran_semester3 jumlah_pelajaran_semester4
              jumlah_pelajaran_semester5]
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

  path '/api/v1/pmdk_total_score_informations/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show pmdk_total_score_information') do
      tags 'Pmdk total score information endpoint'

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

    patch('update pmdk_total_score_information') do
      tags 'Pmdk total score information endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :pmdk_total_score_information, in: :body, schema: {
          type: :object,
          properties: {
            pmdk_total_score_information: {
              type: :object,
              properties: {
                jumlah_nilai_semester1: { type: :number, minimum: 2, maximum: 3000,
                  example: 800 },
                jumlah_nilai_semester2: { type: :number, minimum: 2, maximum: 3000,
                  example: 800 },
                jumlah_nilai_semester3: { type: :number, minimum: 2, maximum: 3000,
                  example: 800 },
                jumlah_nilai_semester4: { type: :number, minimum: 2, maximum: 3000,
                  example: 800 },
                jumlah_nilai_semester5: { type: :number, minimum: 2, maximum: 3000,
                  example: 800},
                jumlah_pelajaran_semester1: { type: :integer, minimum: 2, maximum: 30,
                  example: 8 },
                jumlah_pelajaran_semester2: { type: :integer, minimum: 2, maximum: 30,
                  example: 8 },
                jumlah_pelajaran_semester3: { type: :integer, minimum: 2, maximum: 30,
                  example: 8 },
                jumlah_pelajaran_semester4: { type: :integer, minimum: 2, maximum: 30,
                  example: 8 },
                jumlah_pelajaran_semester5: { type: :integer, minimum: 2, maximum: 30,
                  example: 8},

              },
              # required: %w[jumlah_nilai_semester1 jumlah_nilai_semester2 jumlah_nilai_semester3
              # jumlah_nilai_semester4 jumlah_nilai_semester5 jumlah_pelajaran_semester1
              # jumlah_pelajaran_semester2 jumlah_pelajaran_semester3 jumlah_pelajaran_semester4
              # jumlah_pelajaran_semester5]
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

    put('update pmdk_total_score_information') do
      tags 'Pmdk total score information endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :pmdk_total_score_information, in: :body, schema: {
          type: :object,
          properties: {
            pmdk_total_score_information: {
              type: :object,
              properties: {
                jumlah_nilai_semester1: { type: :number, minimum: 2, maximum: 3000,
                  example: 800 },
                jumlah_nilai_semester2: { type: :number, minimum: 2, maximum: 3000,
                  example: 800 },
                jumlah_nilai_semester3: { type: :number, minimum: 2, maximum: 3000,
                  example: 800 },
                jumlah_nilai_semester4: { type: :number, minimum: 2, maximum: 3000,
                  example: 800 },
                jumlah_nilai_semester5: { type: :number, minimum: 2, maximum: 3000,
                  example: 800},
                jumlah_pelajaran_semester1: { type: :integer, minimum: 2, maximum: 30,
                  example: 8 },
                jumlah_pelajaran_semester2: { type: :integer, minimum: 2, maximum: 30,
                  example: 8 },
                jumlah_pelajaran_semester3: { type: :integer, minimum: 2, maximum: 30,
                  example: 8 },
                jumlah_pelajaran_semester4: { type: :integer, minimum: 2, maximum: 30,
                  example: 8 },
                jumlah_pelajaran_semester5: { type: :integer, minimum: 2, maximum: 30,
                  example: 8},

              },
              # required: %w[jumlah_nilai_semester1 jumlah_nilai_semester2 jumlah_nilai_semester3
              # jumlah_nilai_semester4 jumlah_nilai_semester5 jumlah_pelajaran_semester1
              # jumlah_pelajaran_semester2 jumlah_pelajaran_semester3 jumlah_pelajaran_semester4
              # jumlah_pelajaran_semester5]
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

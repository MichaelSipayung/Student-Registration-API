require 'swagger_helper'

RSpec.describe 'api/v1/pmdk_each_score_informations', type: :request do

  path '/api/v1/pmdk_each_score_informations' do

    post('create pmdk_each_score_information') do
      tags 'Pmdk each score information endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :pmdk_each_score_information, in: :body, schema: {
          type: :object,
          properties: {
            pmdk_each_score_information: {
              type: :object,
              properties: {
                matematika1: { type: :number, minimum: 2, maximum: 100,
                  example: 80 },
                matematika2: { type: :number, minimum: 2, maximum: 100,
                  example: 80 },
                matematika3: { type: :number, minimum: 2, maximum: 100,
                  example: 80 },
                matematika4: { type: :number, minimum: 2, maximum: 100,
                  example: 80 },
                matematika5: { type: :number, minimum: 2, maximum: 100,
                  example: 80 },
                kimia1: { type: :number, minimum: 2, maximum: 100,
                  example: 80 },
                kimia2: { type: :number, minimum: 2, maximum: 100, example: 80 },
                kimia3: { type: :number, minimum: 2, maximum: 100, example: 80 },
                kimia4: { type: :number, minimum: 2, maximum: 100, example: 80 },
                kimia5: { type: :number, minimum: 2, maximum: 100, example: 80 },
                fisika1: { type: :number, minimum: 2, maximum: 100, example: 80 },
                fisika2: { type: :number, minimum: 2, maximum: 100, example: 80 },
                fisika3: { type: :number, minimum: 2, maximum: 100, example: 80 },
                fisika4: { type: :number, minimum: 2, maximum: 100, example: 80 },
                fisika5: { type: :number, minimum: 2, maximum: 100, example: 80 },
                inggris1: { type: :number, minimum: 2, maximum: 100, example: 80 },
                inggris2: { type: :number, minimum: 2, maximum: 100, example: 80 },
                inggris3: { type: :number, minimum: 2, maximum: 100, example: 80 },
                inggris4: { type: :number, minimum: 2, maximum: 100, example: 80 },
                inggris5: { type: :number, minimum: 2, maximum: 100, example: 80},
              },
              required: %w[matematika1 matematika2 matematika3 matematika5 matematika5
                      kimia1 kimia2 kimia3 kimia4 kimia5
                      fisika1 fisika2 fisika3 fisika4 fisika5
                      inggris1 inggris2 inggris3 inggris4 inggris5]
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

  path '/api/v1/pmdk_each_score_informations/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show pmdk_each_score_information') do
      tags 'Pmdk each score information endpoint'

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

    patch('update pmdk_each_score_information') do
      tags 'Pmdk each score information endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :pmdk_each_score_information, in: :body, schema: {
          type: :object,
          properties: {
            pmdk_each_score_information: {
              type: :object,
              properties: {
                matematika1: { type: :number, minimum: 2, maximum: 100,
                  example: 80 },
                matematika2: { type: :number, minimum: 2, maximum: 100,
                  example: 80 },
                matematika3: { type: :number, minimum: 2, maximum: 100,
                  example: 80 },
                matematika4: { type: :number, minimum: 2, maximum: 100,
                  example: 80 },
                matematika5: { type: :number, minimum: 2, maximum: 100,
                  example: 80 },
                kimia1: { type: :number, minimum: 2, maximum: 100,
                  example: 80 },
                kimia2: { type: :number, minimum: 2, maximum: 100, example: 80 },
                kimia3: { type: :number, minimum: 2, maximum: 100, example: 80 },
                kimia4: { type: :number, minimum: 2, maximum: 100, example: 80 },
                kimia5: { type: :number, minimum: 2, maximum: 100, example: 80 },
                fisika1: { type: :number, minimum: 2, maximum: 100, example: 80 },
                fisika2: { type: :number, minimum: 2, maximum: 100, example: 80 },
                fisika3: { type: :number, minimum: 2, maximum: 100, example: 80 },
                fisika4: { type: :number, minimum: 2, maximum: 100, example: 80 },
                fisika5: { type: :number, minimum: 2, maximum: 100, example: 80 },
                inggris1: { type: :number, minimum: 2, maximum: 100, example: 80 },
                inggris2: { type: :number, minimum: 2, maximum: 100, example: 80 },
                inggris3: { type: :number, minimum: 2, maximum: 100, example: 80 },
                inggris4: { type: :number, minimum: 2, maximum: 100, example: 80 },
                inggris5: { type: :number, minimum: 2, maximum: 100, example: 80},
              },
              # required: %w[matematika1 matematika2 matematika3 matematika5 matematika5
              #         kimia1 kimia2 kimia3 kimia4 kimia5
              #         fisika1 fisika2 fisika3 fisika4 fisika5
              #         inggris1 inggris2 inggris3 inggris4 inggris5]
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

    put('update pmdk_each_score_information') do
      tags 'Pmdk each score information endpoint'

      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :pmdk_each_score_information, in: :body, schema: {
          type: :object,
          properties: {
            pmdk_each_score_information: {
              type: :object,
              properties: {
                matematika1: { type: :number, minimum: 2, maximum: 100,
                  example: 80 },
                matematika2: { type: :number, minimum: 2, maximum: 100,
                  example: 80 },
                matematika3: { type: :number, minimum: 2, maximum: 100,
                  example: 80 },
                matematika4: { type: :number, minimum: 2, maximum: 100,
                  example: 80 },
                matematika5: { type: :number, minimum: 2, maximum: 100,
                  example: 80 },
                kimia1: { type: :number, minimum: 2, maximum: 100,
                  example: 80 },
                kimia2: { type: :number, minimum: 2, maximum: 100, example: 80 },
                kimia3: { type: :number, minimum: 2, maximum: 100, example: 80 },
                kimia4: { type: :number, minimum: 2, maximum: 100, example: 80 },
                kimia5: { type: :number, minimum: 2, maximum: 100, example: 80 },
                fisika1: { type: :number, minimum: 2, maximum: 100, example: 80 },
                fisika2: { type: :number, minimum: 2, maximum: 100, example: 80 },
                fisika3: { type: :number, minimum: 2, maximum: 100, example: 80 },
                fisika4: { type: :number, minimum: 2, maximum: 100, example: 80 },
                fisika5: { type: :number, minimum: 2, maximum: 100, example: 80 },
                inggris1: { type: :number, minimum: 2, maximum: 100, example: 80 },
                inggris2: { type: :number, minimum: 2, maximum: 100, example: 80 },
                inggris3: { type: :number, minimum: 2, maximum: 100, example: 80 },
                inggris4: { type: :number, minimum: 2, maximum: 100, example: 80 },
                inggris5: { type: :number, minimum: 2, maximum: 100, example: 80},
              },
              # required: %w[matematika1 matematika2 matematika3 matematika5 matematika5
              #         kimia1 kimia2 kimia3 kimia4 kimia5
              #         fisika1 fisika2 fisika3 fisika4 fisika5
              #         inggris1 inggris2 inggris3 inggris4 inggris5]
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

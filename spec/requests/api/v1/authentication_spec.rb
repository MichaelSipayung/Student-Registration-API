require 'swagger_helper'

RSpec.describe 'api/v1/authentication', type: :request do

  path '/api/v1/auth/login' do

    post('login authentication') do
      tags 'Authentication endpoint'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
              email: {type: :string, minLength: 10},
              password: {type: :string, format: :password, minLength: 6},
            },
              required: %w[email password]
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

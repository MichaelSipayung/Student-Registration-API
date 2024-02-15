require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request, tags: ['User'] do

  path '/api/v1/users' do

    get('list users') do
      tags 'User endpoint'
      response(200, 'successful') do

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

    post('create user') do
      tags 'User endpoint'
      response(201, 'successful') do
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            user: {
              type: :object,
              properties: {
                email: {type: :string, minLength: 10},
                username: {type: :string, minLength: 6},
                password: {type: :string, format: :password, minLength: 6},
                password_confirmation: {type: :string, format: :password, minLength: 6},
              },
              required: %w[email username password password_confirmation]
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

  path '/api/v1/users/{_username}' do
    # You'll want to customize the parameter types...
    parameter name: '_username', in: :path, type: :string, description: '_username'

    get('show user') do
      tags 'User endpoint'

      response(200, 'successful') do
        let(:_username) { '123' }

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

    patch('update user') do
      tags 'User endpoint'

      response(200, 'successful') do
        let(:_username) { '123' }
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            user: {
              type: :object,
              properties: {
                email: {type: :string, minLength: 10},
                username: {type: :string, minLength: 6},
                password: {type: :string, format: :password, minLength: 6},
                password_confirmation: {type: :string, format: :password, minLength: 6},
              },
              # required: %w[email username password password_confirmation]
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

    put('update user') do
      tags 'User endpoint'

      response(200, 'successful') do
        let(:_username) { '123' }
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            user: {
              type: :object,
              properties: {
                email: {type: :string, minLength: 10},
                username: {type: :string, minLength: 6},
                password: {type: :string, format: :password, minLength: 6},
                password_confirmation: {type: :string, format: :password, minLength: 6},
              },
              # required: %w[email username password password_confirmation]
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

    delete('delete user') do
      tags 'User endpoint'

      response(200, 'successful') do
        let(:_username) { '123' }

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

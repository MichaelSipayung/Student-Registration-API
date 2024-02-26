require 'swagger_helper'

RSpec.describe 'api/v1/password_resets', type: :request do

  path '/api/v1/password_resets' do

    post('create password_reset') do
      tags 'Password reset endpoint'
      response(200, 'successful') do
        consumes'application/json'
        parameter name: :password_reset, in: :body, schema:{
          type: :object,
          properties: {
            password_reset: {
              type: :object,
              properties: {
                email: {type: :string, minLength: 10, example: 'michael@gmail.com'},
              }, required: %w[email]
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

  path '/api/v1/password_resets/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    patch('update password_reset') do
      tags 'Password reset endpoint'
      response(200, 'successful') do
        let(:id) { '123456' }
        consumes'application/json'
        parameter name: :id, in: :path, type: :string, format: 'regex', pattern: '^[0-9]{6}$',
          description: 'six digit token sent to user email'
        parameter name: :password_reset, in: :body, schema:{
          type: :object,
          properties: {
            password_reset: {
              type: :object,
              properties: {
                # email with example
                email: {type: :string, minLength: 10, example: 'michael@gmail.com'},
                password: {type: :string, format: :password, minLength: 6},
                password_confirmation: {type: :string, format: :password, minLength: 6},
              }, required: %w[password password_confirmation]
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

    put('update password_reset') do
      tags 'Password reset endpoint'
      response(200, 'successful') do
        let(:id) { '123456' }
        consumes'application/json'
        parameter name: :id, in: :path, type: :string, format: 'regex', pattern: '^[0-9]{6}$',
          description: 'six digit token sent to user email'
        parameter name: :password_reset, in: :body, schema:{
          type: :object,
          properties: {
            password_reset: {
              type: :object,
              properties: {
                email: {type: :string, minLength: 10, example: 'michael@gmail.com'},
                password: {type: :string, format: :password, minLength: 6},
                password_confirmation: {type: :string, format: :password, minLength: 6},
              }, required: %w[password password_confirmation]
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

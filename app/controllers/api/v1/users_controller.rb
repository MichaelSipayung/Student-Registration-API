module Api
  module V1
    class UsersController < ApplicationController
      before_action :authorize_request, except: :create
      before_action :find_user, except: %i[create index]
      before_action :authorize_user, only: %i[update destroy]

      def index
        @users = User.all
        render json: @users, status: :ok
      end

      def show
        render json: @user, status: :ok
      end

      def create
        @user = User.new(user_params)
        if @user.save
          # UserMailer.account_activation(@user).deliver_now
          @user.send_activation_email
          render json: {
            message: 'User created successfully.Check your email to activate your account.',
            user: {name: @user.name, email: @user.email, username: @user.username} },
                 status: :created
        else
          render json: { errors: @user.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def destroy
        if @user.destroy
          render json: { message: 'User was successfully deleted.' }, status: :ok
        else
          render json: { error: 'Something went wrong' }, status: :unprocessable_entity
        end
      end

      def update
        if @user.update(user_params)
          render json: @user, status: :ok
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def find_user
        @user = User.find_by_username!(params[:_username])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
      end

      def user_params
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
      end
    end
  end
end

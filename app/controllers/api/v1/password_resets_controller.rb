module Api
  module V1
    class PasswordResetsController < ApplicationController
      def create
        @user = User.find_by(email: params[:password_reset][:email])
        if @user
          @user.create_reset_digest
          @user.send_password_reset_email
          render json: { message: 'Email sent with password reset instructions' },
            status: :ok
        else
          render json: { errors: 'Email address not found' },
            status: :not_found
        end
      end

      def update
        user = User.find_by(email: params[:password_reset][:email])
        if user && user.authenticated?(:reset, params[:id])
          if user.reset_sent_at < 10.minutes.ago
            render json: { errors: 'Password reset has expired' },
              status: :unprocessable_entity
          elsif user.update(reset_params)
            user.clear_reset_digest
            render json: { message: 'Password has been reset' },
              status: :ok
          else
            render json: { errors: user.errors.full_messages },
              status: :unprocessable_entity
          end
        else
          render json: { errors: 'Invalid reset link' },
            status: :bad_request
        end
      end

      private
        def reset_params
          params.require(:password_reset).permit(:password, :password_confirmation)
        end
    end
  end
end

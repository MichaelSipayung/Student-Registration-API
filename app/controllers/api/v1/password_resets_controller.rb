module Api
  module V1
    class PasswordResetsController < ApplicationController
      def create
        @user = User.find_by(email: params[:password_reset][:email])
        if @user
          if !@user.activated?
            return non_activate_user
          end
          @user.create_reset_digest
          @user.send_password_reset_email
          render json: { message: 'Email sent with password reset instructions' },
            status: :ok
        else
          invalid_email
        end
      end

      def update
        user = User.find_by(email: params[:password_reset][:email])
        if user
          if !user.activated?
            return non_activate_user
          end
          if user.authenticated?(:reset, params[:id])
            if user.reset_sent_at < 10.minutes.ago
              expired_link
            else
              if user.update(reset_params)
                user.clear_reset_digest
                render json: { message: 'Password has been reset' },
                  status: :ok
              else
                render json: { errors: user.errors.full_messages },
                  status: :unprocessable_entity
              end
            end
          else
            invalid_link
          end
        else
          invalid_email
        end
      end

      private
        def reset_params
          params.require(:password_reset).permit(:password, :password_confirmation)
        end

        def non_activate_user
          render json: {
            errors: 'Account not activated, please check your email for the activation link'
          }, status: :unprocessable_entity
        end

        def invalid_email
          render json: { errors: 'Invalid email address' },
            status: :unprocessable_entity
        end

        def invalid_link
          render json: { errors: 'Invalid reset link' },
            status: :bad_request
        end

        def expired_link
          render json: { errors: 'Password reset has expired' },
            status: :unprocessable_entity
        end
    end
  end
end

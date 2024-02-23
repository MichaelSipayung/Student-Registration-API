module Api
  module V1
    class AuthenticationController < ApplicationController
      def login
        @user = User.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
          if @user.activated?
            token = JsonWebToken.encode(user_id: @user.id)
            time = Time.now + 24.hours.to_i
            render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                           username: @user.username }, status: :ok
          else
            render json: { error: 'Account not activated' }, status: :unauthorized
          end
        else
          render json: { error: 'unauthorized' }, status: :unauthorized
        end
      end

      private

      def login_param
        params.permit(:email, :password)
      end
    end
  end
end
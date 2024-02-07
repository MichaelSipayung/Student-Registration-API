class ApplicationController < ActionController::API

  def not_found
    render json: {error: 'not found'}
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode header
      @current_user= User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: {errors: e.message}, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: {errors: e.message}, status: :unauthorized
    end
  end
  def authorize_user
    find_user
    unless @user == @current_user
      render json: {error: "You are not authorized to perform this action"}, status: :unauthorized
    end
  end
end

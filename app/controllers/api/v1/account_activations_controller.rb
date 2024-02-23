class Api::V1::AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? &&
      user.authenticated?(:activation, params[:id])
      user.activate
      render json: { message: 'Account activated' }, status: :ok
    else
      render json: { message: 'Invalid activation link' },
             status: :bad_request
    end
  end

  # private
  # def activate
  #   update_attribute(:activated, true)
  #   update_attribute(:activated_at, Time.zone.now)
  # end

end

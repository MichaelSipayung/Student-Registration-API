class Api::V1::AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? &&
      user.authenticated?(:activation, params[:id])
      activate(user)
      render json: { message: 'Account activated' }, status: :ok
    else
      render json: { message: 'Invalid activation link' },
             status: :bad_request
    end
  end

  private
  def activate(user)
    user.update_attribute(:activated, true)
    user.update_attribute(:activated_at, Time.zone.now)
  end

end

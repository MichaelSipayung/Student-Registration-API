class AddressesController < ApplicationController
  before_action :authorize_request, only: %i[create update show]
  before_action :current_address, only: %i[update show]

  def create
    @address = @current_user.addresses.build(address_params)
    if @address.save
      render json: { message: 'address data was created' }, status: :ok
    else
      render json: {errors: @address.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @address = @current_user.addresses.find(params[:id])
    if @address.update(address_params)
      render json: { message: 'address data updated' }, status: :ok
    else
      render json: {errors: @address.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @address = @current_user.addresses.find(params[:id])
    render json: @address, status: :ok
  end

  private

  def current_address
    @address = @current_user.addresses
    render json: {errors: 'address data not found'}, status: :not_found if @address.nil? ||
      @address.id != params[:id].to_i
  end

  def address_params
    params.require(:address).permit(:alamat, :kelurahan, :kecamatan, :kode_pos, :provinsi,
                                    :no_telepon, :kabupaten)
  end

end

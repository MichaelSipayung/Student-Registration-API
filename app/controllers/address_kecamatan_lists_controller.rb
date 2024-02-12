class AddressKecamatanListsController < ApplicationController
  before_action :authorize_request, only: %i[create update show]
  before_action :set_address_kecamatan_list, only: %i[show update destroy]
  def create
    @address_kecamatan_list =
      AddressKecamatanList.new(address_kecamatan_list_params)
    if @address_kecamatan_list.save
      render json: {message: 'Kecamatan was created'}, status: :ok
    else
      render json: {errors: @address_kecamatan_list.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def update
    if @address_kecamatan_list.update(address_kecamatan_list_params)
      render json: {message: 'Kecamatan updated'}, status: :ok
    else
      render json: {errors: @address_kecamatan_list.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def show
    @address_kecamatan_list = AddressKecamatanList.find(params[:id])
    render json: @address_kecamatan_list, status: :ok
  end

  def destroy

  end

  private

  def set_address_kecamatan_list
    @address_kecamatan_list = AddressKecamatanList.find(params[:id])
    render json: {errors: 'Kecamatan not found'},
           status: :not_found if @address_kecamatan_list.nil?
  end

  # Only allow a list of trusted parameters through.
  def address_kecamatan_list_params
    params.require(:address_kecamatan_list).permit(:kecamatan, :address_kabupaten_list_id)
  end
end

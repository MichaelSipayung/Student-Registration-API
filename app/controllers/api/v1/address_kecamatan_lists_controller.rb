module Api
  module V1
    class AddressKecamatanListsController < ApplicationController
      before_action :authorize_request, only: %i[create update show destroy]
      before_action :set_address_kecamatan_list, only: %i[show update destroy]
      before_action :authorize_admin, only: %i[update destroy create]

      def index
        @address_kecamatan_lists = AddressKecamatanList.all
        render json: @address_kecamatan_lists, status: :ok
      end

      def create
        @address_kecamatan_list =
          AddressKecamatanList.new(address_kecamatan_list_params)
        if @address_kecamatan_list.save
          render json: { message: 'Kecamatan was created' }, status: :ok
        else
          render json: { errors: @address_kecamatan_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        if @address_kecamatan_list.update(address_kecamatan_list_params)
          render json: { message: 'Kecamatan updated' }, status: :ok
        else
          render json: { errors: @address_kecamatan_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def show
        @address_kecamatan_list = AddressKecamatanList.find(params[:id])
        render json: @address_kecamatan_list, status: :ok
      end

      def destroy
        @address_kecamatan_list = AddressKecamatanList.find(params[:id])
        if @address_kecamatan_list.destroy
          render json: { message: 'Kecamatan deleted' }, status: :ok
        else
          render json: { errors: @address_kecamatan_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      private

      def set_address_kecamatan_list
        @address_kecamatan_list = AddressKecamatanList.find(params[:id])
        render json: { errors: 'Kecamatan not found' },
               status: :not_found if @address_kecamatan_list.nil?
      end

      # Only allow a list of trusted parameters through.
      def address_kecamatan_list_params
        params.require(:address_kecamatan_list).permit(:kecamatan, :address_kabupaten_list_id)
      end
    end
  end
end

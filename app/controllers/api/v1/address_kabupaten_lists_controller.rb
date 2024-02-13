module Api
  module V1
    class AddressKabupatenListsController < ApplicationController
      before_action :authorize_request, only: %i[create update show]
      before_action :set_address_kabupaten_list, only: %i[show update destroy]

      def create
        @address_kabupaten_list =
          AddressKabupatenList.new(address_kabupaten_list_params)
        if @address_kabupaten_list.save
          render json: { message: 'Kabupaten was created' }, status: :ok
        else
          render json: { errors: @address_kabupaten_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        if @address_kabupaten_list.update(address_kabupaten_list_params)
          render json: { message: 'Kabupaten updated' }, status: :ok
        else
          render json: { errors: @address_kabupaten_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def show
        @address_kabupaten_list = AddressKabupatenList.find(params[:id])
        render json: @address_kabupaten_list, status: :ok
      end

      def destroy

      end

      private

      def set_address_kabupaten_list
        @address_kabupaten_list = AddressKabupatenList.find(params[:id])
        render json: { errors: 'Kabupaten not found' },
               status: :not_found if @address_kabupaten_list.nil?
      end

      # Only allow a list of trusted parameters through.
      def address_kabupaten_list_params
        params.require(:address_kabupaten_list).permit(:kabupaten, :address_province_list_id)
      end
    end
  end
end

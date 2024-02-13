module Api
  module V1
    class AddressProvinceListsController < ApplicationController
      before_action :authorize_request, only: %i[create update show]
      before_action :set_address_province_list, only: %i[show update destroy]
      def create
        @address_province_list =
          AddressProvinceList.new(address_province_list_params)
        if @address_province_list.save
          render json: {message: 'Province was created'}, status: :ok
        else
          render json: {errors: @address_province_list.errors.full_messages},
                 status: :unprocessable_entity
        end
      end

      def update
        if @address_province_list.update(address_province_list_params)
          render json: {message: 'Province updated'}, status: :ok
        else
          render json: {errors: @address_province_list.errors.full_messages},
                 status: :unprocessable_entity
        end
      end

      def show
        @address_province_list = AddressProvinceList.find(params[:id])
        render json: @address_province_list, status: :ok
      end

      def destroy

      end

      private

      def set_address_province_list
        @address_province_list = AddressProvinceList.find(params[:id])
        render json: {errors: 'Province tingkat not found'},
               status: :not_found if @address_province_list.nil?
      end

      # Only allow a list of trusted parameters through.
      def address_province_list_params
        params.require(:address_province_list).permit(:provinsi)
      end
    end
  end
end


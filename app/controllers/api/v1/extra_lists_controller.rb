module Api
  module V1
    class ExtraListsController < ApplicationController
      before_action :authorize_request, only: %i[create update show]
      before_action :set_extra_list, only: %i[show update destroy]

      def create
        @extra_list =
          ExtraList.new(extra_list_params)
        if @extra_list.save
          render json: { message: 'extra list was created' }, status: :ok
        else
          render json: { errors: @extra_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        if @extra_list.update(extra_list_params)
          render json: { message: 'extra list updated' }, status: :ok
        else
          render json: { errors: @extra_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def show
        @extra_list = ExtraList.find(params[:id])
        render json: @extra_list, status: :ok
      end

      def destroy

      end

      private

      def set_extra_list
        @extra_list = ExtraList.find(params[:id])
        render json: { errors: 'extra not found' },
               status: :not_found if @extra_list.nil?
      end

      # Only allow a list of trusted parameters through.
      def extra_list_params
        params.require(:extra_list).permit(:predikat)
      end
    end
  end
end
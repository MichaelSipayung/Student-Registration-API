module Api
  module V1
    class ExtraListsController < ApplicationController
      before_action :authorize_request, only: %i[create update show destroy]
      before_action :set_extra_list, only: %i[show update destroy]
      before_action :authorize_admin, only: %i[update destroy create]

      def index
        @extra_lists = ExtraList.all
        render json: @extra_lists, status: :ok
      end

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
        @extra_list = ExtraList.find(params[:id])
        if @extra_list.destroy
          render json: { message: 'extra list deleted' }, status: :ok
        else
          render json: { errors: @extra_list.errors.full_messages },
                 status: :unprocessable_entity
        end
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

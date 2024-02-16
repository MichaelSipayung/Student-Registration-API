module Api
  module V1
    class MajorListsController < ApplicationController
      before_action :authorize_request, only: %i[create update show destroy]
      before_action :set_major_list, only: %i[show update destroy]
      before_action :authorize_admin, only: %i[update destroy create]

      def index
        @major_lists = MajorList.all
        render json: @major_lists, status: :ok
      end

      def create
        @major_list =
          MajorList.new(major_list_params)
        if @major_list.save
          render json: { message: 'major list was created' }, status: :ok
        else
          render json: { errors: @major_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        if @major_list.update(major_list_params)
          render json: { message: 'major list updated' }, status: :ok
        else
          render json: { errors: @major_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def show
        @major_list = MajorList.find(params[:id])
        render json: @major_list, status: :ok
      end

      def destroy
        @major_list = MajorList.find(params[:id])
        if @major_list.destroy
          render json: { message: 'major list deleted' }, status: :ok
        else
          render json: { errors: @major_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      private

      def set_major_list
        @major_list = MajorList.find(params[:id])
        render json: { errors: 'major list not found' },
               status: :not_found if @major_list.nil?
      end

      # Only allow a list of trusted parameters through.
      def major_list_params
        params.require(:major_list).permit(:jurusan)
      end
    end
  end
end

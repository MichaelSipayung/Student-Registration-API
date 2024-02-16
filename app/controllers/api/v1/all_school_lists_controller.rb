module Api
  module V1
    class AllSchoolListsController < ApplicationController
      before_action :authorize_request, only: %i[create update show destroy]
      before_action :set_all_school_list, only: %i[show update destroy]
      before_action :authorize_admin, only: %i[update destroy create]

      def index
        @all_school_lists = AllSchoolList.all
        render json: @all_school_lists, status: :ok
      end

      def create
        @all_school_list =
          AllSchoolList.new(all_school_list_params)
        if @all_school_list.save
          render json: { message: 'School list was created' }, status: :ok
        else
          render json: { errors: @all_school_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        if @all_school_list.update(all_school_list_params)
          render json: { message: 'School updated' }, status: :ok
        else
          render json: { errors: @all_school_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def show
        @all_school_list = AllSchoolList.find(params[:id])
        render json: @all_school_list, status: :ok
      end

      def destroy
        @all_school_list = AllSchoolList.find(params[:id])
        if @all_school_list.destroy
          render json: { message: 'School deleted' }, status: :ok
        else
          render json: { errors: @all_school_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      private

      def set_all_school_list
        @all_school_list = AllSchoolList.find(params[:id])
        render json: { errors: 'School not found' },
               status: :not_found if @all_school_list.nil?
      end

      # Only allow a list of trusted parameters through.
      def all_school_list_params
        params.require(:all_school_list).permit(:sekolah)
      end
    end
  end
end

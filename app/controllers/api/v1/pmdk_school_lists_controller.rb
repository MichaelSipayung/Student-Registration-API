module Api
  module V1
    class PmdkSchoolListsController < ApplicationController
      before_action :authorize_request, only: %i[create update show destroy]
      before_action :set_pmdk_school_list, only: %i[show update destroy]
      before_action :authorize_admin, only: %i[update destroy create]

      def index
        @pmdk_school_lists = PmdkSchoolList.all
        render json: @pmdk_school_lists, status: :ok
      end

      def create
        @pmdk_school_list =
          PmdkSchoolList.new(pmdk_school_list_params)
        if @pmdk_school_list.save
          render json: { message: 'Pmdk school list was created' }, status: :ok
        else
          render json: { errors: @pmdk_school_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        if @pmdk_school_list.update(pmdk_school_list_params)
          render json: { message: 'Pmdk School updated' }, status: :ok
        else
          render json: { errors: @pmdk_school_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def show
        @pmdk_school_list = PmdkSchoolList.find(params[:id])
        render json: @pmdk_school_list, status: :ok
      end

      def destroy
        @pmdk_school_list = PmdkSchoolList.find(params[:id])
        if @pmdk_school_list.destroy
          render json: { message: 'Pmdk School deleted' }, status: :ok
        else
          render json: { errors: @pmdk_school_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      private

      def set_pmdk_school_list
        @pmdk_school_list = PmdkSchoolList.find(params[:id])
        render json: { errors: 'Pmdk school not found' },
               status: :not_found if @pmdk_school_list.nil?
      end

      # Only allow a list of trusted parameters through.
      def pmdk_school_list_params
        params.require(:pmdk_school_list).permit(:sekolah)
      end
    end
  end
end

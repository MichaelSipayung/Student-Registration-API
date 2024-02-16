module Api
  module V1
    class AccreditationSchoolListsController < ApplicationController
      before_action :authorize_request, only: %i[create update show destroy]
      before_action :set_accreditation_school_list, only: %i[show update destroy]
      before_action :authorize_admin, only: %i[update destroy create]

      def index
        @accreditation_school_lists = AccreditationSchoolList.all
        render json: @accreditation_school_lists, status: :ok
      end

      def create
        @accreditation_school_list =
          AccreditationSchoolList.new(accreditation_school_list_params)
        if @accreditation_school_list.save
          render json: {message: 'Accreditation was created'}, status: :ok
        else
          render json: {errors: @accreditation_school_list.errors.full_messages},
                 status: :unprocessable_entity
        end
      end

      def update
        if @accreditation_school_list.update(accreditation_school_list_params)
          render json: {message: 'accreditation updated'}, status: :ok
        else
          render json: {errors: @accreditation_school_list.errors.full_messages},
                 status: :unprocessable_entity
        end
      end

      def show
        @accreditation_school_list = AccreditationSchoolList.find(params[:id])
        render json: @accreditation_school_list, status: :ok
      end

      def destroy
        @accreditation_school_list = AccreditationSchoolList.find(params[:id])
        if @accreditation_school_list.destroy
          render json: {message: 'accreditation deleted'}, status: :ok
        else
          render json: {errors: @accreditation_school_list.errors.full_messages},
                 status: :unprocessable_entity
        end
      end

      private

      def set_accreditation_school_list
        @accreditation_school_list = AccreditationSchoolList.find(params[:id])
        render json: {errors: 'Accreditation not found'},
               status: :not_found if @accreditation_school_list.nil?
      end

      # Only allow a list of trusted parameters through.
      def accreditation_school_list_params
        params.require(:accreditation_school_list).permit(:akreditasi)
      end
    end
  end
end

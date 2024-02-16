module Api
  module V1
    class ParentJobListsController < ApplicationController
      before_action :authorize_request, only: %i[create update show destroy]
      before_action :set_parent_job_list, only: %i[show update destroy]
      before_action :authorize_admin, only: %i[update destroy create]

      def index
        @parent_job_lists = ParentJobList.all
        render json: @parent_job_lists, status: :ok
      end

      def create
        @parent_job_list =
          ParentJobList.new(parent_job_list_params)
        if @parent_job_list.save
          render json: { message: 'parent job list was created' }, status: :ok
        else
          render json: { errors: @parent_job_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        if @parent_job_list.update(parent_job_list_params)
          render json: { message: 'parent job list updated' }, status: :ok
        else
          render json: { errors: @parent_job_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def show
        @parent_job_list = ParentJobList.find(params[:id])
        render json: @parent_job_list, status: :ok
      end

      def destroy
        @parent_job_list = ParentJobList.find(params[:id])
        if @parent_job_list.destroy
          render json: { message: 'parent job list deleted' }, status: :ok
        else
          render json: { errors: @parent_job_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      private

      def set_parent_job_list
        @parent_job_list = ParentJobList.find(params[:id])
        render json: { errors: 'parent job list not found' },
               status: :not_found if @parent_job_list.nil?
      end

      # Only allow a list of trusted parameters through.
      def parent_job_list_params
        params.require(:parent_job_list).permit(:pekerjaan)
      end
    end
  end
end

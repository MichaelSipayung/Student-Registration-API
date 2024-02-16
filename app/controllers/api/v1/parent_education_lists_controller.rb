module Api
  module V1
    class ParentEducationListsController < ApplicationController
      before_action :authorize_request, only: %i[create update show destroy]
      before_action :set_parent_education_list, only: %i[show update destroy]
      before_action :authorize_admin, only: %i[update destroy create]

      def index
        @parent_education_lists = ParentEducationList.all
        render json: @parent_education_lists, status: :ok
      end

      def create
        @parent_education_list =
          ParentEducationList.new(parent_education_list_params)
        if @parent_education_list.save
          render json: { message: 'parent education list was created' }, status: :ok
        else
          render json: { errors: @parent_education_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        if @parent_education_list.update(parent_education_list_params)
          render json: { message: 'parent education list updated' }, status: :ok
        else
          render json: { errors: @parent_education_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def show
        @parent_education_list = ParentEducationList.find(params[:id])
        render json: @parent_education_list, status: :ok
      end

      def destroy
        @parent_education_list = ParentEducationList.find(params[:id])
        if @parent_education_list.destroy
          render json: { message: 'parent education list deleted' }, status: :ok
        else
          render json: { errors: @parent_education_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      private

      def set_parent_education_list
        @parent_education_list = ParentEducationList.find(params[:id])
        render json: { errors: 'parent education list not found' },
               status: :not_found if @parent_education_list.nil?
      end

      # Only allow a list of trusted parameters through.
      def parent_education_list_params
        params.require(:parent_education_list).permit(:pendidikan)
      end
    end
  end
end

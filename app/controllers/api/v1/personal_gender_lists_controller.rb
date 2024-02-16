module Api
  module V1
    class PersonalGenderListsController < ApplicationController
      before_action :authorize_request, only: %i[create update show destroy]
      before_action :set_personal_gender_list, only: %i[show update destroy]
      before_action :authorize_admin, only: %i[update destroy create]

      def index
        @personal_gender_lists = PersonalGenderList.all
        render json: @personal_gender_lists, status: :ok
      end

      def create
        @personal_gender_list =
          PersonalGenderList.new(personal_gender_list_params)
        if @personal_gender_list.save
          render json: { message: 'personal gender list was created' }, status: :ok
        else
          render json: { errors: @personal_gender_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        if @personal_gender_list.update(personal_gender_list_params)
          render json: { message: 'personal gender list updated' }, status: :ok
        else
          render json: { errors: @personal_gender_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def show
        @personal_gender_list = PersonalGenderList.find(params[:id])
        render json: @personal_gender_list, status: :ok
      end

      def destroy
        @personal_gender_list = PersonalGenderList.find(params[:id])
        if @personal_gender_list.destroy
          render json: { message: 'personal gender list deleted' }, status: :ok
        else
          render json: { errors: @personal_gender_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      private

      def set_personal_gender_list
        @personal_gender_list = PersonalGenderList.find(params[:id])
        render json: { errors: 'personal gender list not found' },
               status: :not_found if @personal_gender_list.nil?
      end

      # Only allow a list of trusted parameters through.
      def personal_gender_list_params
        params.require(:personal_gender_list).permit(:jenis_kelamin)
      end
    end
  end
end

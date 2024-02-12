module Api
  module V1
    class PersonalReligionListsController < ApplicationController
      before_action :authorize_request, only: %i[create update show]
      before_action :set_personal_religion_list, only: %i[show update destroy]

      def create
        @personal_religion_list =
          PersonalReligionList.new(personal_religion_list_params)
        if @personal_religion_list.save
          render json: { message: 'personal religion list was created' }, status: :ok
        else
          render json: { errors: @personal_religion_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update

        if @personal_religion_list.update(personal_religion_list_params)
          render json: { message: 'personal religion list updated' }, status: :ok
        else
          render json: { errors: @personal_religion_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def show
        @personal_religion_list = PersonalReligionList.find(params[:id])
        render json: @personal_religion_list, status: :ok
      end

      def destroy

      end

      private

      def set_personal_religion_list
        @personal_religion_list = PersonalReligionList.find(params[:id])
        render json: { errors: 'personal religion list not found' },
               status: :not_found if @personal_religion_list.nil?
      end

      # Only allow a list of trusted parameters through.
      def personal_religion_list_params
        params.require(:personal_religion_list).permit(:agama)
      end
    end
  end
end
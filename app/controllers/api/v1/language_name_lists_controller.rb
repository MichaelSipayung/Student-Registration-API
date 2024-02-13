module Api
  module V1
    class LanguageNameListsController < ApplicationController
      before_action :authorize_request, only: %i[create update show]
      before_action :set_language_name_list, only: %i[show update destroy]

      def create
        @language_name_list =
          LanguageNameList.new(language_name_list_params)
        if @language_name_list.save
          render json: { message: 'language name list was created' }, status: :ok
        else
          render json: { errors: @language_name_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        if @language_name_list.update(language_name_list_params)
          render json: { message: 'language name list updated' }, status: :ok
        else
          render json: { errors: @language_name_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def show
        @language_name_list = LanguageNameList.find(params[:id])
        render json: @language_name_list, status: :ok
      end

      def destroy

      end

      private

      def set_language_name_list
        @language_name_list = LanguageNameList.find(params[:id])
        render json: { errors: 'language name list not found' },
               status: :not_found if @language_name_list.nil?
      end

      # Only allow a list of trusted parameters through.
      def language_name_list_params
        params.require(:language_name_list).permit(:bahasa)
      end
    end
  end
end
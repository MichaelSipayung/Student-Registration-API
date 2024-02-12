module Api
  module V1
    class LanguageDegreeListsController < ApplicationController
      before_action :authorize_request, only: %i[create update show]
      before_action :set_language_degree_list, only: %i[show update destroy]

      def create
        @language_degree_list =
          LanguageDegreeList.new(language_degree_list_params)
        if @language_degree_list.save
          render json: { message: 'language degree list was created' }, status: :ok
        else
          render json: { errors: @language_degree_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        if @language_degree_list.update(language_degree_list_params)
          render json: { message: 'language degree list updated' }, status: :ok
        else
          render json: { errors: @language_degree_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def show
        @language_degree_list = LanguageDegreeList.find(params[:id])
        render json: @language_degree_list, status: :ok
      end

      def destroy

      end

      private

      def set_language_degree_list
        @language_degree_list = LanguageDegreeList.find(params[:id])
        render json: { errors: 'language degree list not found' },
               status: :not_found if @language_degree_list.nil?
      end

      # Only allow a list of trusted parameters through.
      def language_degree_list_params
        params.require(:language_degree_list).permit(:tingkat)
      end
    end
  end
end

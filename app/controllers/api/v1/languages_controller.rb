module Api
  module V1
    class LanguagesController < ApplicationController
      before_action :authorize_request, only: %i[create update show]
      before_action :current_language, only: %i[update show]

      def create
        @language = @current_user.languages.build(language_params)
        if @language.save
          render json: { message: 'language data was created' }, status: :ok
        else
          render json: { errors: @language.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        @language = @current_user.languages.find(params[:id])
        if @language.update(language_params)
          render json: { message: 'language data updated' }, status: :ok
        else
          render json: { errors: @language.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        @language = @current_user.languages.find(params[:id])
        render json: @language, status: :ok
      end

      private

      def current_language
        @language = @current_user.languages.find(params[:id])
        render json: { errors: 'language data not found' }, status: :not_found if @language.nil? ||
          @language.id != params[:id].to_i
      end

      def language_params
        params.require(:language).permit(:nama_bahasa, :tingkat)
      end

    end
  end
end
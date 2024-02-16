module Api
  module V1
    class AchievementTingkatListsController < ApplicationController
      before_action :authorize_request, only: %i[create update show destroy]
      before_action :set_achievement_tingkat_list, only: %i[show update destroy]
      before_action :authorize_admin, only: %i[update destroy create]

      def create
        @achievement_tingkat_list =
          AchievementTingkatList.new(achievement_tingkat_list_params)
        if @achievement_tingkat_list.save
          render json: {message: 'Achievement tingkat was created'}, status: :ok
        else
          render json: {errors: @achievement_tingkat_list.errors.full_messages},
                 status: :unprocessable_entity
        end
      end

      def update
        if @achievement_tingkat_list.update(achievement_tingkat_list_params)
          render json: {message: 'Achievement tingkat updated'}, status: :ok
        else
          render json: {errors: @achievement_tingkat_list.errors.full_messages},
                 status: :unprocessable_entity
        end
      end

      def show
        @achievement_tingkat_list = AchievementTingkatList.find(params[:id])
        render json: @achievement_tingkat_list, status: :ok
      end

      def destroy
        @achievement_tingkat_list = AchievementTingkatList.find(params[:id])
        if @achievement_tingkat_list.destroy
          render json: {message: 'Achievement tingkat deleted'}, status: :ok
        else
          render json: {errors: @achievement_tingkat_list.errors.full_messages},
                 status: :unprocessable_entity
        end
      end

      private

      def set_achievement_tingkat_list
          @achievement_tingkat_list = AchievementTingkatList.find(params[:id])
        render json: {errors: 'Achievement tingkat not found'},
               status: :not_found if @achievement_tingkat_list.nil?
      end

      # Only allow a list of trusted parameters through.
      def achievement_tingkat_list_params
        params.require(:achievement_tingkat_list).permit(:tingkat)
      end
    end
  end
end
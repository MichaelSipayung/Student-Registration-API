module Api
  module V1
    class AchievementKategoriListsController < ApplicationController
      before_action :authorize_request, only: %i[create update show destroy]
      before_action :set_achievement_kategori_list, only: %i[show update destroy]
      before_action :authorize_admin, only: %i[update destroy create]

      def index
        @achievement_kategori_lists = AchievementKategoriList.all
        render json: @achievement_kategori_lists, status: :ok
      end

      def create
        @achievement_kategori_list =
          AchievementKategoriList.new(achievement_kategori_list_params)
        if @achievement_kategori_list.save
          render json: {message: 'Achievement was created'}, status: :ok
        else
          render json: {errors: @achievement_kategori_list.errors.full_messages},
                 status: :unprocessable_entity
        end
      end

      def update
        if @achievement_kategori_list.update(achievement_kategori_list_params)
          render json: {message: 'Achievement updated'}, status: :ok
        else
          render json: {errors: @achievement_kategori_list.errors.full_messages},
                 status: :unprocessable_entity
        end
      end

      def show
        @achievement_kategori_list = AchievementKategoriList.find(params[:id])
        render json: @achievement_kategori_list, status: :ok
      end

      def destroy
        @achievement_kategori_list = AchievementKategoriList.find(params[:id])
        if @achievement_kategori_list.destroy
          render json: {message: 'achievement category deleted'}, status: :ok
        else
          render json: {errors: @achievement_kategori_list.errors.full_messages},
                 status: :unprocessable_entity
        end
      end

      private

      def set_achievement_kategori_list
        @achievement_kategori_list = AchievementKategoriList.find(params[:id])
        render json: {errors: 'Achievement not found'},
               status: :not_found if @achievement_kategori_list.nil?
      end

      # Only allow a list of trusted parameters through.
      def achievement_kategori_list_params
        params.require(:achievement_kategori_list).permit(:kategori)
      end
    end
  end
end

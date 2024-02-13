module Api
  module V1
    class SourcesController < ApplicationController
      before_action :authorize_request, only: %i[create update show]
      before_action :current_source, only: %i[update show]
      before_action :fill_source, only: %i[create]

      def create
        @source = @current_user.build_source(source_params)
        if @source.save
          render json: { message: 'Source data was created' }, status: :ok
        else
          render json: { errors: @source.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        @source = @current_user.source
        if @source.update(source_params)
          render json: { message: 'Source data updated' }, status: :ok
        else
          render json: { errors: @source.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        @source = @current_user.source
        render json: @source, status: :ok
      end

      private

      def source_params
        params.require(:source).permit(:jumlah_n, :sumber_informasi, :motivasi)
      end

      def current_source
        @source = @current_user.source
        render json: { errors: 'source data not found' }, status: :not_found if @source.nil? ||
          @source.id != params[:id].to_i
      end

      def fill_source
        @source = @current_user.source
        render json: { errors: 'source data already exist, go update it' },
               status: :unprocessable_entity if @source
      end
    end
  end
end
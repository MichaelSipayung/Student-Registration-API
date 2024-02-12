module Api
  module V1
    class ExtrasController < ApplicationController
      before_action :authorize_request, only: %i[create update show]
      before_action :current_extra, only: %i[update show]

      def create
        @extra = @current_user.extras.build(extra_params)
        if @extra.save
          render json: { message: 'extra data was created' }, status: :ok
        else
          render json: { errors: @extra.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        @extra = @current_user.extras.find(params[:id])
        if @extra.update(extra_params)
          render json: { message: 'extra data updated' }, status: :ok
        else
          render json: { errors: @extra.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        @extra = @current_user.extras.find(params[:id])
        render json: @extra, status: :ok
      end

      private

      def current_extra
        @extra = @current_user.extras.find(params[:id])
        render json: { errors: 'extra data not found' }, status: :not_found if @extra.nil? ||
          @extra.id != params[:id].to_i
      end

      def extra_params
        params.require(:extra).permit(:nama_kegiatan, :mulai, :berakhir, :predikat)
      end

    end
  end
end
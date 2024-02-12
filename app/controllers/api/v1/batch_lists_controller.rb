module Api
  module V1
    class BatchListsController < ApplicationController
      before_action :authorize_request, only: %i[create update show]
      before_action :set_batch_list, only: %i[show update destroy]

      def create
        @batch_list =
          BatchList.new(batch_list_params)
        if @batch_list.save
          render json: { message: 'batch list was created' }, status: :ok
        else
          render json: { errors: @batch_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        if @batch_list.update(batch_list_params)
          render json: { message: 'batch list updated' }, status: :ok
        else
          render json: { errors: @batch_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def show
        @batch_list = BatchList.find(params[:id])
        render json: @batch_list, status: :ok
      end

      def destroy

      end

      private

      def set_batch_list
        @batch_list = BatchList.find(params[:id])
        render json: { errors: 'batch not found' },
               status: :not_found if @batch_list.nil?
      end

      # Only allow a list of trusted parameters through.
      def batch_list_params
        params.require(:batch_list).permit(:gelombang, :aktif)
      end
    end
  end
end
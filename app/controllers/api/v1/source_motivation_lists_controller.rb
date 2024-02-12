module Api
  module V1
    class SourceMotivationListsController < ApplicationController
      before_action :authorize_request, only: %i[create update show]
      before_action :set_source_motivation_list, only: %i[show update destroy]

      def create
        @source_motivation_list =
          SourceMotivationList.new(source_motivation_list_params)
        if @source_motivation_list.save
          render json: { message: 'source motivation list was created' }, status: :ok
        else
          render json: { errors: @source_motivation_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update

        if @source_motivation_list.update(source_motivation_list_params)
          render json: { message: 'source motivation list updated' }, status: :ok
        else
          render json: { errors: @source_motivation_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def show
        @source_motivation_list = SourceMotivationList.find(params[:id])
        render json: @source_motivation_list, status: :ok
      end

      def destroy

      end

      private

      def set_source_motivation_list
        @source_motivation_list = SourceMotivationList.find(params[:id])
        render json: { errors: 'source motivation list not found' },
               status: :not_found if @source_motivation_list.nil?
      end

      # Only allow a list of trusted parameters through.
      def source_motivation_list_params
        params.require(:source_motivation_list).permit(:motivasi)
      end
    end
  end
end
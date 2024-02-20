module Api
  module V1
    class UtbkFileUploadsController < ApplicationController
      before_action :authorize_request, only: %i[create update show]
      before_action :fill_utbk_file_upload, only: %i[create]
      before_action :current_utbk_file_upload, only: %i[update show]

      def show
        @utbk_file_upload = UtbkFileUpload.find_by(id: params[:id])
        if @utbk_file_upload
          render json: {sertifikat_utbk: url_for(@utbk_file_upload.sertifikat_utbk)},
            status: :ok
        else
          render json: {errors: 'utbk file upload not found'},
            status: :not_found
        end
      end

      def create
        @utbk_file_upload = @current_user.build_utbk_file_upload(utbk_file_upload_params)
        @utbk_file_upload.sertifikat_utbk.attach(params[:sertifikat_utbk])
        if @utbk_file_upload.save
          render json: {
            message: 'utbk file upload created',
            sertifikat_utbk_uploaded: @utbk_file_upload.sertifikat_utbk.attached?
          },status: :created
        else
          render json: {errors: @utbk_file_upload.errors.full_messages},
            status: :unprocessable_entity
        end
      end

      def update
        @utbk_file_upload = @current_user.utbk_file_upload
        if params[:sertifikat_utbk].present?
          @utbk_file_upload.sertifikat_utbk.attach(params[:sertifikat_utbk])
        end

        if @utbk_file_upload.save
          render json: {
            message: 'utbk file upload updated',
            sertifikat_utbk_uploaded: @utbk_file_upload.sertifikat_utbk.attached?
          }, status: :ok
        else
          render json: {errors: @utbk_file_upload.errors.full_messages},
            status: :unprocessable_entity
        end
      end

      private

      def utbk_file_upload_params #refactoring to use strong params
        params.permit(:sertifikat_utbk)
      end

      def fill_utbk_file_upload
        @utbk_file_upload = @current_user.utbk_file_upload
        render json: {errors: 'utbk file upload already exist, go update it'},
          status: :unprocessable_entity if @utbk_file_upload
      end

      def current_utbk_file_upload
        @utbk_file_upload = @current_user.utbk_file_upload
        render json: {errors: 'utbk file upload not found'},
          status: :not_found if @utbk_file_upload.nil? ||
            @utbk_file_upload.id != params[:id].to_i
      end

    end
  end
end

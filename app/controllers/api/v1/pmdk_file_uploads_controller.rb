module Api
  module V1
    class PmdkFileUploadsController < ApplicationController
      before_action :authorize_request, only: %i[create update show]
      before_action :fill_pmdk_file_upload, only: %i[create]
      before_action :current_pmdk_file_upload, only: %i[update show]

      def show
        @pmdk_file_upload= PmdkFileUpload.find_by(id: params[:id])
        if @pmdk_file_upload
          render json: {
            sertifikat: url_for(@pmdk_file_upload.sertifikat),
            surat_rekomendasi: url_for(@pmdk_file_upload.surat_rekomendasi),
            nilai_rapor: url_for(@pmdk_file_upload.nilai_rapor)
          }, status: :ok
        else
          render json: {errors: 'pmdk file upload not found'},
            status: :not_found
        end
      end

      def create
        @pmdk_file_upload =
          @current_user.build_pmdk_file_upload(pmdk_file_upload_params)
        @pmdk_file_upload.sertifikat.attach(pmdk_file_upload_params[:sertifikat])
        @pmdk_file_upload.surat_rekomendasi.attach(pmdk_file_upload_params[:surat_rekomendasi])
        @pmdk_file_upload.nilai_rapor.attach(pmdk_file_upload_params[:nilai_rapor])

        if @pmdk_file_upload.save
          render json: {
            message: 'pmdk file upload success',
            sertifikat_uploaded: @pmdk_file_upload.sertifikat.attached?,
            surat_rekomendasi_uploaded: @pmdk_file_upload.surat_rekomendasi.attached?,
            nilai_rapor_uploaded: @pmdk_file_upload.nilai_rapor.attached?
          }, status: :ok
        else
          render json: {errors: @pmdk_file_upload.errors.full_messages},
            status: :unprocessable_entity
        end
      end

      def update
        @pmdk_file_upload = @current_user.pmdk_file_upload
        if params[:sertifikat].present?
          @pmdk_file_upload.sertifikat.attach(params[:sertifikat])
        end
        if params[:surat_rekomendasi].present?
          @pmdk_file_upload.surat_rekomendasi.attach(params[:surat_rekomendasi])
        end
        if params[:nilai_rapor].present?
          @pmdk_file_upload.nilai_rapor.attach(params[:nilai_rapor])
        end
        if @pmdk_file_upload.save
          render json: {
            message: 'pmdk file upload updated',
            sertifikat_uploaded: @pmdk_file_upload.sertifikat.attached?,
            surat_rekomendasi_uploaded: @pmdk_file_upload.surat_rekomendasi.attached?,
            nilai_rapor_uploaded: @pmdk_file_upload.nilai_rapor.attached?
          }, status: :ok
        else
          render json: {errors: @pmdk_file_upload.errors.full_messages},
            status: :unprocessable_entity
        end
      end

      private

        def pmdk_file_upload_params
          params.permit(:sertifikat,:surat_rekomendasi, :nilai_rapor)
        end

        # reject to upload if already exist
        def fill_pmdk_file_upload
          @pmdk_file_upload = @current_user.pmdk_file_upload
          render json: {errors: 'pmdk file upload already exist, go update it'},
            status: :unprocessable_entity if @pmdk_file_upload
        end

        def current_pmdk_file_upload
          @pmdk_file_upload = @current_user.pmdk_file_upload
          render json: {errors: 'pmdk file upload not found'},
            status: :not_found if @pmdk_file_upload.nil? ||
              @pmdk_file_upload.id != params[:id].to_i
        end
    end
  end
end

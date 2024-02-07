class PmdkSchoolInformationsController < ApplicationController
  before_action :authorize_request, only: %i[create update show]
  before_action :current_pmdk_school, only: %i[update show]
  before_action :fill_pmdk_school, only: %i[create]

  def create
    @pmdk_school_information = @current_user.build_pmdk_school_information(pmdk_school_information_params)
    if @pmdk_school_information.save
      render json: { message: 'pmdk school information was created' }, status: :ok
    else
      render json: {errors: @pmdk_school_information.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @pmdk_school_information = @current_user.pmdk_school_information
    if @pmdk_school_information.update(pmdk_school_information_params)
      render json: { message: 'Personal data updated' }, status: :ok
    else
      render json: {errors: @pmdk_school_information.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @pmdk_school_information = @current_user.pmdk_school_information
    render json: @pmdk_school_information, status: :ok
  end

  private

  def current_pmdk_school
    @pmdk_school_information = @current_user.pmdk_school_information
    render json: {errors: 'pmdk_school_information data not found'},
           status: :not_found if @pmdk_school_information.nil? ||
      @pmdk_school_information.id != params[:id].to_i
  end

  def pmdk_school_information_params
    params.require(:pmdk_school_information).permit(:asal_sekolah, :jurusan_sekolah,
                                                    :akreditas,
                                                    :jumlah_pelajaran_un,
                                                    :jumlah_nilai_un)
  end

  def fill_pmdk_school
    @pmdk_school_information = @current_user.pmdk_school_information
    render json: {errors: 'pmdk_school_information data already exist, go update it'},
           status: :unprocessable_entity if  @pmdk_school_information
  end
end

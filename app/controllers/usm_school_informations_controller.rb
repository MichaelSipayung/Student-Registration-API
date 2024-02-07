class UsmSchoolInformationsController < ApplicationController
  before_action :authorize_request, only: %i[create update show]
  before_action :current_usm_school, only: %i[update show]
  before_action :fill_usm_school, only: %i[create]

  def create
    @usm_school = @current_user.build_usm_school_information(usm_school_information_params)
    if @usm_school.save
      render json: { message: 'usm school information was created' }, status: :ok
    else
      render json: {errors: @usm_school.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @usm_school = @current_user.usm_school_information
    if @usm_school.update(usm_school_information_params)
      render json: { message: 'usm school information updated' }, status: :ok
    else
      render json: {errors: @usm_school.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @usm_school = @current_user.usm_school_information
    render json: @usm_school, status: :ok
  end

  private

  def current_usm_school
    @usm_school = @current_user.usm_school_information
    render json: {errors: 'usm_school data not found'}, status: :not_found if @usm_school.nil? ||
      @usm_school.id != params[:id].to_i
  end

  def usm_school_information_params
    params.require(:usm_school_information).permit(
      :jurusan_sekolah, :asal_sekolah, :akreditas, :jumlah_nilai_un,
      :jumlah_pelajaran_un, :jumlah_pelajaran_semester5, :jumlah_nilai_semester5
    )
  end

  def fill_usm_school
    @usm_school = @current_user.usm_school_information
    render json: {errors: 'usm_school data already exist, go update it'},
           status: :unprocessable_entity if  @usm_school
  end
end

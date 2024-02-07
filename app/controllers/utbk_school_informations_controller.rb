class UtbkSchoolInformationsController < ApplicationController
  before_action :authorize_request, only: %i[create update show]
  before_action :current_utbk_school, only: %i[update show]
  before_action :fill_utbk_school, only: %i[create]

  def create
    @utbk_school_information = @current_user.build_utbk_school_information(utbk_school_information_params)
    if @utbk_school_information.save
      render json: { message: 'utbk school information was created' }, status: :ok
    else
      render json: {errors: @utbk_school_information.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @utbk_school_information = @current_user.utbk_school_information
    if @utbk_school_information.update(utbk_school_information_params)
      render json: { message: 'utbk school information updated' }, status: :ok
    else
      render json: {errors: @utbk_school_information.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @utbk_school_information = @current_user.utbk_school_information
    render json: @utbk_school_information, status: :ok
  end

  private

  def current_utbk_school
    @utbk_school_information = @current_user.utbk_school_information
    render json: {errors: 'utbk school information not found'},
           status: :not_found if @utbk_school_information.nil? ||
      @utbk_school_information.id != params[:id].to_i
  end

  def utbk_school_information_params
    params.require(:utbk_school_information).permit(:asal_sekolah, :akreditas, :jurusan_sekolah,
                                                    :jumlah_pelajaran_un,
                                                    :jumlah_nilai_un)
  end

  def fill_utbk_school
    @utbk_school_information = @current_user.utbk_school_information
    render json: {errors: 'utbk school information data already exist, go update it'},
           status: :unprocessable_entity if  @utbk_school_information
  end
end

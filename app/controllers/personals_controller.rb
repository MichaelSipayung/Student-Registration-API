class PersonalsController < ApplicationController
  before_action :authorize_request, only: %i[create update show]
  before_action :current_personal, only: %i[update show]
  before_action :fill_personal, only: %i[create]

  def create
    @personal = @current_user.build_personal(personal_params)
    if @personal.save
      render json: { message: 'Personal data was created' }, status: :ok
    else
      render json: {errors: @personal.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @personal = @current_user.personal
    if @personal.update(personal_params)
      render json: { message: 'Personal data updated' }, status: :ok
    else
      render json: {errors: @personal.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @personal = @current_user.personal
    render json: @personal, status: :ok
  end

  private

  def current_personal
    @personal = @current_user.personal
    render json: {errors: 'personal data not found'}, status: :not_found if @personal.nil? ||
      @personal.id != params[:id].to_i
  end

  def personal_params
    params.require(:personal).permit(:nama_lengkap, :agama, :nik, :nisn, :no_kps, :tanggal_lahir,
                                     :tempat_lahir, :jenis_kelamin, :domisili, :pas_photo)
  end

  def fill_personal
    @personal = @current_user.personal
    render json: {errors: 'personal data already exist, go update it'},
           status: :unprocessable_entity if  @personal
  end
end

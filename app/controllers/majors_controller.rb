class MajorsController < ApplicationController
  before_action :authorize_request, only: %i[create update show]
  before_action :current_major, only: %i[edit update show]
  before_action :fill_major, only: %i[new create]

  def create
    @major = @current_user.build_major(major_params)
    if @major.save
      render json: { message: 'major data was created' }, status: :ok
    else
      render json: {errors: @major.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @major = @current_user.major
    if @major.update(major_params)
      render json: { message: 'major data updated' }, status: :ok
    else
      render json: {errors: @major.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @major = @current_user.major
    render json: @major, status: :ok
  end

  private

  def major_params
    params.require(:major).permit(:jurusan1, :jurusan2, :jurusan3, :gelombang)
  end

  def current_major
    @major = @current_user.major
    render json: {errors: 'major data not found'}, status: :not_found if @major.nil? ||
      @major.id != params[:id].to_i
  end

  def fill_major
    @major = @current_user.major
    render json: {errors: 'major data already exist, go update it'},
           status: :unprocessable_entity if  @major
  end

end

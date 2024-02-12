class HighSchoolMajorListsController < ApplicationController
  before_action :authorize_request, only: %i[create update show]
  before_action :set_high_school_major, only: %i[show update destroy]
  def create
    @high_school_major =
      HighSchoolMajorList.new(high_school_major_params)
    if @high_school_major.save
      render json: {message: 'high school major list was created'}, status: :ok
    else
      render json: {errors: @high_school_major.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def update
    if @high_school_major.update(high_school_major_params)
      render json: {message: 'high school major list updated'}, status: :ok
    else
      render json: {errors: @high_school_major.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def show
    @high_school_major = HighSchoolMajorList.find(params[:id])
    render json: @high_school_major, status: :ok
  end

  def destroy

  end

  private

  def set_high_school_major
    @high_school_major = HighSchoolMajorList.find(params[:id])
    render json: {errors: 'high school major not found'},
           status: :not_found if @high_school_major.nil?
  end

  # Only allow a list of trusted parameters through.
  def high_school_major_params
    params.require(:high_school_major).permit(:jurusan)
  end
end

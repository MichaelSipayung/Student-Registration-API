class AllSchoolListsController < ApplicationController
  before_action :authorize_request, only: %i[create update show]
  before_action :set_all_school_list, only: %i[show update destroy]
  def create
    @all_school_list =
      AllSchoolList.new(all_school_list_params)
    if @all_school_list.save
      render json: {message: 'School list was created'}, status: :ok
    else
      render json: {errors: @all_school_list.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def update
    if @all_school_list.update(all_school_list_params)
      render json: {message: 'School updated'}, status: :ok
    else
      render json: {errors: @all_school_list.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def show
    @all_school_list = AllSchoolList.find(params[:id])
    render json: @all_school_list, status: :ok
  end

  def destroy

  end

  private

  def set_all_school_list
    @all_school_list = AllSchoolList.find(params[:id])
    render json: {errors: 'School not found'},
           status: :not_found if @all_school_list.nil?
  end

  # Only allow a list of trusted parameters through.
  def all_school_list_params
    params.require(:all_school_list).permit(:sekolah)
  end
end

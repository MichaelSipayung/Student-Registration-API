class SourceInformationListsController < ApplicationController
  before_action :authorize_request, only: %i[create update show]
  before_action :set_source_information_list, only: %i[show update destroy]
  def create
    @source_information_list =
      SourceInformationList.new(source_information_list_params)
    if @source_information_list.save
      render json: {message: 'source information list was created'}, status: :ok
    else
      render json: {errors: @source_information_list.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def update

    if @source_information_list.update(source_information_list_params)
      render json: {message: 'source information list updated'}, status: :ok
    else
      render json: {errors: @source_information_list.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def show
    @source_information_list = SourceInformationList.find(params[:id])
    render json: @source_information_list, status: :ok
  end

  def destroy

  end

  private

  def set_source_information_list
    @source_information_list = SourceInformationList.find(params[:id])
    render json: {errors: 'source information list not found'},
           status: :not_found if @source_information_list.nil?
  end

  # Only allow a list of trusted parameters through.
  def source_information_list_params
    params.require(:source_information_list).permit(:informasi)
  end
end

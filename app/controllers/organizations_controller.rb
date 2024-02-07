class OrganizationsController < ApplicationController
  before_action :authorize_request, only: %i[create update show]
  before_action :current_organization, only: %i[update show]

  def create
    @organization = @current_user.organizations.build(organization_params)
    if @organization.save
      render json: { message: 'organization data was created' }, status: :ok
    else
      render json: {errors: @organization.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @organization = @current_user.organizations.find(params[:id])
    if @organization.update(organization_params)
      render json: { message: 'organization data updated' }, status: :ok
    else
      render json: {errors: @organization.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @organization = @current_user.organizations.find(params[:id])
    render json: @organization, status: :ok
  end

  private

  def current_organization
    @organization = @current_user.organizations.find(params[:id])
    render json: {errors: 'organization data not found'}, status: :not_found if @organization.nil? ||
      @organization.id != params[:id].to_i
  end

  def organization_params
    params.require(:organization).permit(:nama_organisasi, :mulai, :berakhir, :jabatan)
  end

end

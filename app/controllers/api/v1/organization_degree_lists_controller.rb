module Api
  module V1
    class OrganizationDegreeListsController < ApplicationController
      before_action :authorize_request, only: %i[create update show]
      before_action :set_organization_degree_list, only: %i[show update destroy]

      def create
        @organization_degree_list =
          OrganizationDegreeList.new(organization_degree_list_params)
        if @organization_degree_list.save
          render json: { message: 'organization degree list was created' }, status: :ok
        else
          render json: { errors: @organization_degree_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        if @organization_degree_list.update(organization_degree_list_params)
          render json: { message: 'organization degree list updated' }, status: :ok
        else
          render json: { errors: @organization_degree_list.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def show
        @organization_degree_list = OrganizationDegreeList.find(params[:id])
        render json: @organization_degree_list, status: :ok
      end

      def destroy

      end

      private

      def set_organization_degree_list
        @organization_degree_list = OrganizationDegreeList.find(params[:id])
        render json: { errors: 'organization degree list not found' },
               status: :not_found if @organization_degree_list.nil?
      end

      # Only allow a list of trusted parameters through.
      def organization_degree_list_params
        params.require(:organization_degree_list).permit(:jabatan)
      end
    end
  end
end
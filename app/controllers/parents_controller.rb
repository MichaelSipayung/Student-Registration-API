class ParentsController < ApplicationController

  before_action :authorize_request, only: %i[create update show]
  before_action :current_parent, only: %i[update show]
  before_action :fill_parent, only: %i[create]

  def create
    @parent = @current_user.build_parent(parent_params)
    if @parent.save
      render json: { message: 'Parent data was created' }, status: :ok
    else
      render json: {errors: @parent.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @parent = @current_user.parent
    if @parent.update(parent_params)
      render json: { message: 'Parent data updated' }, status: :ok
    else
      render json: {errors: @parent.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @parent = @current_user.parent
    render json: @parent, status: :ok
  end

  private

  def parent_params
    params.require(:parent).permit(:nama_ayah, :nama_ibu, :nik_ayah, :nik_ibu, :pendidikan_ayah,
                                   :pendidikan_ibu, :tanggal_lahir_ayah, :tanggal_lahir_ibu,
                                   :pekerjaan_ayah, :pekerjaan_ibu)
  end

  def current_parent
    @parent = @current_user.parent
    render json: {errors: 'parent data not found'}, status: :not_found if @parent.nil? ||
      @parent.id != params[:id].to_i
  end

  def fill_parent
    @parent = @current_user.parent
    render json: {errors: 'parent data already exist, go update it'},
           status: :unprocessable_entity if  @parent
  end

end

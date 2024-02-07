class PmdkEachScoreInformationsController < ApplicationController
  before_action :authorize_request, only: %i[create update show]
  before_action :current_pmdk_each_score, only: %i[update show]
  before_action :fill_pmdk_each_score, only: %i[create]

  def create
    @pmdk_each_score = @current_user.pmdk_each_score_information(pmdk_each_score_information_params)
    if @pmdk_each_score.save
      render json: { message: 'pmdk each score data was created' }, status: :ok
    else
      render json: {errors: @pmdk_each_score.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @pmdk_each_score = @current_user.pmdk_each_score_information
    if @pmdk_each_score.update(pmdk_each_score_information_params)
      render json: { message: 'pmdk each score data updated' }, status: :ok
    else
      render json: {errors: @pmdk_each_score.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @pmdk_each_score = @current_user.pmdk_each_score_information
    render json: @pmdk_each_score, status: :ok
  end

  private

  def current_pmdk_each_score
    @pmdk_each_score = @current_user.pmdk_each_score_information
    render json: {errors: 'pmdk_each_score data not found'}, status: :not_found if @pmdk_each_score.nil? ||
      @pmdk_each_score.id != params[:id].to_i
  end

  def pmdk_each_score_information_params
    params.require(:pmdk_each_score_information).permit(
      :matematika_semester1, :matematika_semester2, :matematika_semester3, :matematika_semester4,
      :matematika5, :kimia1, :kimia2, :kimia3, :kimia4,
      :kimia5, :fisika1, :fisika2, :fisika3, :fisika4,
      :fisika5, :inggris1, :inggris2, :inggris3,
      :inggris4, :inggris5
    )
  end

  def fill_pmdk_each_score
    @pmdk_each_score = @current_user.pmdk_each_score_information
    render json: {errors: 'pmdk_each_score data already exist, go update it'},
           status: :unprocessable_entity if  @pmdk_each_score
  end
end

class PmdkTotalScoreInformationController < ApplicationController
  before_action :authorize_request, only: %i[create update show]
  before_action :current_pmdk_total_score, only: %i[update show]
  before_action :fill_pmdk_total, only: %i[create]

  def create
    @pmdk_total_score = @current_user.build_pmdk_total_score_information(pmdk_total_score_params)
    if @pmdk_total_score.save
      render json: { message: 'pmdk total score was created' }, status: :ok
    else
      render json: {errors: @pmdk_total_score.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @pmdk_total_score = @current_user.pmdk_total_score
    if @pmdk_total_score.update(pmdk_total_score_params)
      render json: { message: 'pmdk total score updated' }, status: :ok
    else
      render json: {errors: @pmdk_total_score.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @pmdk_total_score = @current_user.pmdk_total_score
    render json: @pmdk_total_score, status: :ok
  end

  private

  def current_pmdk_total_score
    @pmdk_total_score = @current_user.pmdk_total_score
    render json: {errors: 'pmdk_total_score data not found'}, status: :not_found if @pmdk_total_score.nil? ||
      @pmdk_total_score.id != params[:id].to_i
  end

  def pmdk_total_score_params
    params.require(:pmdk_total_score_information).permit(
      :jumlah_nilai_semester1, :jumlah_nilai_semester2, :jumlah_nilai_semester3,
      :jumlah_nilai_semester4, :jumlah_nilai_semester5,
      :jumlah_pelajaran_semester1, :jumlah_pelajaran_semester2,
      :jumlah_pelajaran_semester3, :jumlah_pelajaran_semester4, :jumlah_pelajaran_semester5
    )
  end

  def fill_pmdk_total
    @pmdk_total_score = @current_user.pmdk_total_score
    render json: {errors: 'pmdk_total_score data already exist, go update it'},
           status: :unprocessable_entity if  @pmdk_total_score
  end
end

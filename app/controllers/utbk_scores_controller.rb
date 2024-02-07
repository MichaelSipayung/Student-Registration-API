class UtbkScoresController < ApplicationController
  before_action :authorize_request, only: %i[create update show]
  before_action :current_utbk, only: %i[update show]
  before_action :fill_utbk, only: %i[create]

  def create
    @utbk_score = @current_user.build_utbk_score(utbk_score_params)
    if @utbk_score.save
      render json: { message: 'Utbk score data was created' }, status: :ok
    else
      render json: {errors: @utbk_score.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @utbk_score = @current_user.utbk_score
    if @utbk_score.update(utbk_score_params)
      render json: { message: 'utbk score data updated' }, status: :ok
    else
      render json: {errors: @utbk_score.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @utbk_score = @current_user.utbk_score
    render json: @utbk_score, status: :ok
  end

  private

  def current_utbk
    @utbk_score = @current_user.utbk_score
    render json: {errors: 'utbk_score data not found'}, status: :not_found if @utbk_score.nil? ||
      @utbk_score.id != params[:id].to_i
  end

  def utbk_score_params
    params.require(:utbk_score).permit(:no_peserta, :tanggal_ujian,
                                       :jumlah_nilai_semester6,
                                       :jumlah_pelajaran_semester6,
                                       :nilai_penalaran_umum,
                                       :nilai_pengetahuan_kuantitatif,
                                       :nilai_kemampuan_memahami_bacaan_dan_menulis,
                                       :nilai_pengetahuan_dan_pemahaman_umum)
  end

  def fill_utbk
    @utbk_score = @current_user.utbk_score
    render json: {errors: 'utbk score data already exist, go update it'},
           status: :unprocessable_entity if  @utbk_score
  end
end

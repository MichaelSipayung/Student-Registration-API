class AchievementsController < ApplicationController
  before_action :authorize_request, only: %i[create update show]
  before_action :current_achievement, only: %i[update show]

  def create
    @achievement = @current_user.achievements.build(achievement_params)
    if @achievement.save
      render json: { message: 'achievement data was created' }, status: :ok
    else
      render json: {errors: @achievement.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @achievement = @current_user.achievements.find(params[:id])
    if @achievement.update(achievement_params)
      render json: { message: 'achievement data updated' }, status: :ok
    else
      render json: {errors: @achievement.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @achievement = @current_user.achievements.find(params[:id])
    render json: @achievement, status: :ok
  end

  private

  def current_achievement
    @achievement = @current_user.achievements.find(params[:id])
    render json: {errors: 'achievement data not found'}, status: :not_found if @achievement.nil? ||
      @achievement.id != params[:id].to_i
  end

  def achievement_params
    params.require(:achievement).permit(:nama_prestasi, :tahun, :tingkat, :kategori)
  end

end

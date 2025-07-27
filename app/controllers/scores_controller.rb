class ScoresController < ApplicationController
  def index
    game = Game.find(params[:game_id])
    scores = game.scores.includes(:player)
    render json: scores.as_json(include: :player)
  end

  def create
    game = Game.find(params[:game_id])
    score_params = params.require(:score).permit(:player_id, :points)
    score = game.scores.new(score_params)
    score.save!
    render json: score
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  def update
    score = Score.find(params[:id])
    score.update!(score_params)
    render json: score
  end

  def destroy
    Score.find(params[:id]).destroy!
    head :no_content
  end

  private

  def score_params
    params.require(:score).permit(:game_id, :player_id, :points)
  end
end

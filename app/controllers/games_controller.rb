class GamesController < ApplicationController
  def create
    game = Game.create!(game_params)
    render json: game
  end

  def with_scores
    games = Game.includes(scores: :player).order(date: :desc).map do |game|
      {
        id: game.id,
        date: game.date,
        scores: game.scores.map do |score|
          {
            id: score.id,
            points: score.points,
            player: {
              id: score.player.id,
              name: score.player.name
            }
          }
        end
      }
    end

    render json: games
  end

  private

  def game_params
    params.require(:game).permit(:date)
  end

  def index_with_scores
    games = Game.includes(scores: :player).order(date: :desc)
    render json: games.as_json(include: { scores: { include: :player } })
  end
end

class PlayersController < ApplicationController
  def index
    render json: Player.all
  end

  def create
    player = Player.create!(player_params)
    render json: player, status: :created
  end

  def update
    player = Player.find(params[:id])
    player.update!(player_params)
    render json: player
  end

  def destroy
    Player.find(params[:id]).destroy!
    head :no_content
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end
end

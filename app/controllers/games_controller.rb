class GamesController < ApplicationController
  def show
    game = Game.find(params[:id].to_i)

    render json: game, status: :ok, serializer: GameDetailsSerializer
  end

  def preview
    game = Game.find(params[:game_id].to_i)

    render json: game, status: :ok
  end

  def index
    games = Game.all

    render json: games, status: :ok
  end
end

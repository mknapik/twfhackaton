class GamesController < ApplicationController
  def show
    game = Game.find(params[:id].to_i)

    render json: game, status: :ok, serializer: GameDetailsSerializer
  end

  def preview
    game = Game.find(params[:game_id].to_i)

    render json: game, status: :ok
  end

  def solution
    tiles = tiles_params
    game = Game.find(params[:game_id].to_i)

    rating = game.check_solution(tiles)

    render json: {rating: rating}, status: :ok
  end

  def index
    games = Game.all

    render json: games, status: :ok
  end

  private

  def tiles_params
    params[:tiles].nil? ? [] : params.require(:tiles).map(&:to_i)
  end
end

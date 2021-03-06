class TilesController < ApplicationController
  layout 'admin'

  def new
    @tile = Tile.new
  end

  def index
    @tiles = Tile.all
  end

  def create
    @tile = Tile.new(tile_params)

    if @tile.save
      redirect_to :tiles, notice: 'Tile was successfully created.'
    else
      render action: 'new'
    end
  end

  private

  def tile_params
    params.require(:tile).permit(:image, :name)
  end
end

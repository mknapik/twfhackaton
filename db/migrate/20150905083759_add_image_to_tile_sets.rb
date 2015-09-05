class AddImageToTileSets < ActiveRecord::Migration
  def add
    add_attachment :tile_sets, :image
  end

  def down
    remove_attachment :tile_sets, :image
  end
end

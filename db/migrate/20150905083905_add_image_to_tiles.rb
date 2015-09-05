class AddImageToTiles < ActiveRecord::Migration
  def add
    add_attachment :tiles, :image
  end

  def down
    remove_attachment :tiles, :image
  end
end

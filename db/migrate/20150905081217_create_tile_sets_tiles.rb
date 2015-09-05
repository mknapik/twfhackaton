class CreateTileSetsTiles < ActiveRecord::Migration
  def change
    create_table :tile_sets_tiles do |t|
      t.integer :tile_id, null: false
      t.integer :tile_set_id, null: false
    end
  end
end

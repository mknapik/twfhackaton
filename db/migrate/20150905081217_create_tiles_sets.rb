class CreateTilesSets < ActiveRecord::Migration
  def change
    create_table :tiles_sets do |t|
      t.integer :tile_id, null: false
      t.integer :tile_set_id, null: false
    end
  end
end

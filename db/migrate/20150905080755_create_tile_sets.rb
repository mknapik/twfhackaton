class CreateTileSets < ActiveRecord::Migration
  def change
    create_table :tile_sets do |t|
      t.string :name, null: false
      t.integer :game_id, null: false

      t.timestamps null: false
    end
  end
end

class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.integer :game_id, null: false
      t.integer :tile_id, null: false
      t.integer :order, null: true
      t.integer :set, null: true

      t.timestamps null: false
    end
  end
end

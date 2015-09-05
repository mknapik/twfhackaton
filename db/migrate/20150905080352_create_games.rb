class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.text :description
      t.integer :game_type_id, null: false

      t.timestamps null: false
    end
  end
end

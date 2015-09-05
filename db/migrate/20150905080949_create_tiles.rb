class CreateTiles < ActiveRecord::Migration
  def change
    create_table :tiles do |t|
      t.string :name, null: false
      t.attachment :image

      t.timestamps null: false
    end
  end
end

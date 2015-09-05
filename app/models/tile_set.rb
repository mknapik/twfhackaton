class TileSet < ActiveRecord::Base
  belongs_to :game
  has_and_belongs_to_many :tiles

  has_attached_file :image
  validates :name, :game_id, presence: true
  validates_attachment :image, presence: true
end

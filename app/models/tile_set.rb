class TileSet < ActiveRecord::Base
  belongs_to :game
  has_and_belongs_to_many :tiles

  validates :name, :game_id, presence: true
  validates :image, attachment_presence: true
end

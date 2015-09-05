class Game < ActiveRecord::Base
  belongs_to :game_type
  has_many :solutions
  has_many :tile_sets

  validates :name, :game_type, presence: true
end

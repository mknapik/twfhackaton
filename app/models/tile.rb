class Tile < ActiveRecord::Base
  has_and_belongs_to_many :tile_sets
  has_many :solutions

  validates :name, presence: true
  validates :image, attachment_presence: true
end

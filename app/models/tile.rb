class Tile < ActiveRecord::Base
  has_and_belongs_to_many :tile_sets
  has_many :solutions

  has_attached_file :image
  validates :name, presence: true
  validates_attachment :image, presence: true
end

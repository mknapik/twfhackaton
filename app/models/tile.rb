class Tile < ActiveRecord::Base
  has_and_belongs_to_many :tile_sets
  has_many :solutions

  has_attached_file :image,
                    styles: {medium: '300x300>', thumb: '100x100>'}

  validates :name, presence: true
  validates_attachment :image, presence: true
  validates_attachment :image,
                       content_type: {content_type: /\Aimage\/.*\Z/}
end

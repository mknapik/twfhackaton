class TileSet < ActiveRecord::Base
  belongs_to :game
  has_and_belongs_to_many :tiles

  has_attached_file :image,
                    styles: {medium: '300x300>', thumb: '100x100>'}

  validates :name, :game_id, presence: true
  validates_attachment :image, presence: true
  validates_attachment :image,
                       content_type: {content_type: /\Aimage\/.*\Z/}
end

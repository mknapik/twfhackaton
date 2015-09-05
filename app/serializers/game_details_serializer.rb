class GameDetailsSerializer < ActiveModel::Serializer
  attributes :id, :name, :description

  has_many :tile_sets


end

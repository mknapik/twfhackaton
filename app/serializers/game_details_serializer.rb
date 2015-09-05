class GameDetailsSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :no_solutions

  has_many :tile_sets
end

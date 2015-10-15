class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image

  def image
    'http://lorempixel.com/200/200/abstract'
  end
end

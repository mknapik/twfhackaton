class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image

  def image
    "http://lorempixel.com/200/200/abstract?q=#{Random.rand(100000)}"
  end
end

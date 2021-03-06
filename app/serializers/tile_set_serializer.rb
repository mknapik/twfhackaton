class TileSetSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_uri

  has_many :tiles

  def image_uri
    object.image.url
  end
end

class TileSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_uri

  def image_uri
    object.image.url
  end
end

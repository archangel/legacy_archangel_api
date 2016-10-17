module Archangel
  class TagSerializer < ActiveModel::Serializer
    attributes :name, :slug, :description
  end
end

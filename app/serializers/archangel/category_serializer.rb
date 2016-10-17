module Archangel
  class CategorySerializer < ActiveModel::Serializer
    attributes :name, :slug, :description
  end
end

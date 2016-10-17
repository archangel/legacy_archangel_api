module Archangel
  class PageSerializer < ActiveModel::Serializer
    attributes :id, :title, :path, :slug, :content, :meta_keywords,
               :meta_description
  end
end

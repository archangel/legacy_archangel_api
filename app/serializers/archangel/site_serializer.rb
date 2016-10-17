module Archangel
  class SiteSerializer < ActiveModel::Serializer
    attributes :name, :locale, :logo, :meta_keywords, :meta_description
  end
end

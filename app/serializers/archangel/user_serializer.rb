module Archangel
  class UserSerializer < ActiveModel::Serializer
    attributes :name, :username, :avatar
  end
end

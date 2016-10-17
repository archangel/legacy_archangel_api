module Archangel
  class ProfileSerializer < ActiveModel::Serializer
    attributes :name, :username, :avatar, :phone, :email
  end
end

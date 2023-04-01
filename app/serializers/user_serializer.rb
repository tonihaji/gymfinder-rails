class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :gym
end

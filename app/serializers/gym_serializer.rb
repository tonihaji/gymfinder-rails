class GymSerializer < ActiveModel::Serializer
  attributes :id, :image, :name, :location, :operatingHours, :price, :contact
  has_one :admin
end
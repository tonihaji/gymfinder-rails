class Gym < ApplicationRecord
    belongs_to :admin
    has_many :users
    validates :name, presence: true
    validates :image,presence: true
    validates :location, presence: true
    validates :operatingHours, presence: true
    validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :contact, presence: true, numericality: { only_integer: true }
  end
  
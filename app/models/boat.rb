class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :brand, presence: true
  validates :engine, presence: true
  validates :pickup_address, presence: true
  validates :year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cost, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

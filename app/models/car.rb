class Car < ApplicationRecord
  #references
  has_many :bookings

  #validations
  validates :regnumber, presence: true, length: {in: 7..7}, format: { with: '/^[A-Z0-9]$/'}
  validates :model, presence: true
  validates :capacity, presence: true
  validates :start_mileage, presence: true
  enum status: [:available, :not_available, :under_maintainence]
  validates :curr_rate, presence: true
  validates :pickup_address, presence: true
end

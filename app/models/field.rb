class Field < ApplicationRecord
  has_one :club
  has_many :reservations

  validates :field_type, presence: true
  validates :availability, presence: true
  validates :price, presence: true
end

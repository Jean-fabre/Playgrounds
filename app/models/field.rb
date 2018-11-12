class Field < ApplicationRecord
  belongs_to :club
  has_many :reservations
  has_many :availabilities

  validates :field_type, presence: true
  validates :availibility, presence: true, inclusion: { in: ["Tennis", "Squash", "Paddel"] }
  validates :price, presence: true
end

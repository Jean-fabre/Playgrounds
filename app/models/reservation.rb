class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :field

  validates :booking_day, presence: true
  validates :booking_hour_start, presence: true
  validates :booking_hour_end, presence: true
end

class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :field

  validates :timetable, presence: true
end

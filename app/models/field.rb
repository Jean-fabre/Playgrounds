class Field < ApplicationRecord
  has_one :club
  has_many :reservations

  has_many :availabilities
  has_one :user, through: :club

  validates :field_type, presence: true, inclusion: { in: ["Tennis", "Squash", "Padel"] }
  validates :availability, presence: true
  validates :price, presence: true
  mount_uploader :photo, PhotoUploader
end

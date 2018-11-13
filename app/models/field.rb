class Field < ApplicationRecord
  belongs_to :club
  has_many :reservations
  has_many :availabilities

  validates :field_type, presence: true
  validates :availability, presence: true, inclusion: { in: ["Tennis", "Squash", "Padel"] }
  validates :price, presence: true
  mount_uploader :photo, PhotoUploader
end

class Field < ApplicationRecord
  has_one :club
  has_many :events

  has_many :availabilities
  has_one :user, through: :club

  validates :field_type, presence: true, inclusion: { in: ["Tennis", "Squash", "Padel"] }
  validates :price, presence: true
  mount_uploader :photo, PhotoUploader
end

class Field < ApplicationRecord
  belongs_to :club
  has_many :events

  has_many :availabilities
  has_one :user, through: :club

  validates :field_type, presence: true, inclusion: { in: ["Tennis", "Squash", "Padel"] }
  validates :price, presence: true
end

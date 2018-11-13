class Review < ApplicationRecord
  has_one :club
  has_one :user

  validates :rating, presence: true
end

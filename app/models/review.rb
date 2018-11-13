class Review < ApplicationRecord
  belongs_to :club
  belongs_to :user

  validates :rating, presence: true
end

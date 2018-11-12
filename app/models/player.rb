class Player < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :phone_number, presence: true
  validates :tennis_level, inclusion: { in: ["Beginner", "Intermediate", "Advanced", "Expert"]}
  validates :squash_level, inclusion: { in: ["Beginner", "Intermediate", "Advanced", "Expert"]}
  validates :padel_level, inclusion: { in: ["Beginner", "Intermediate", "Advanced", "Expert"]}
end

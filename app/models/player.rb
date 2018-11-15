class Player < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :phone_number, presence: true
  validates :gender, presence: true, inclusion: { in: ["Female", "Male"]}
  mount_uploader :photo, PhotoUploader
end

class Club < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :fields
  validates :user_id, uniqueness: true
  validates :name, presence: true
  validates :address, presence: true
  mount_uploader :photo, PhotoUploader
end

class Club < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :fields
  has_many :events, through: :fields
  validates :name, presence: true
  validates :address, presence: true
  mount_uploader :photo, PhotoUploader
end

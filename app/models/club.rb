class Club < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :fields
  has_many :events, through: :fields
  validates :user_id, uniqueness: true
  validates :user_id, uniqueness: true
  validates :name, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader
end

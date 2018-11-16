class Field < ApplicationRecord
  belongs_to :club
  has_many :events

  has_many :availabilities
  has_one :user, through: :club

  validates :field_type, presence: true, inclusion: { in: ["Tennis", "Squash", "Padel"] }
  validates :price, presence: true
  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :global_search,
    against: [:field_type],
    associated_against: {
      club: [:address]
    },
    using: {
      tsearch: { prefix: true }
    }
end

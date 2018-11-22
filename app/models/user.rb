class User < ApplicationRecord
  after_create :set_if_club
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_messageable

  has_one :player
  has_one :club
  has_many :fields, through: :club
  has_many :events
  has_many :reviews, dependent: :destroy

  def name
    "User #{id}"
  end

  def set_if_club
    if is_player
    self.is_player = false
    self.save!
    else
    self.is_player = true
    self.save!
    end
  end

  def mailboxer_email(object)
    nil
  end
end

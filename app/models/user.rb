class User < ApplicationRecord
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

  def mailboxer_email(object)
    nil
  end
end

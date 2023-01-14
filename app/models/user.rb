class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :activities
  has_many :reviews, through: :bookings, dependent: :destroy

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :username, presence: true
  # validates :email, presence: true
  # validates :password, presence: true
end

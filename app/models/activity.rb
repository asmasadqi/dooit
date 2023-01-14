class Activity < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through :bookings

  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: ["Art & Culture", "Entertainment", "Food & Drink", "Sports", "Tours", "Sightseeing", "Nature & Outdoors"] }
  validates :localization, presence: true
end

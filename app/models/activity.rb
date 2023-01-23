class Activity < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: ["Art & Culture", "Entertainment", "Food & Drink", "Sports", "Tours", "Sightseeing", "Nature & Outdoors"] }
  validates :localization, presence: true

  include PgSearch::Model
  
  pg_search_scope :search_by_title_description_category,
    against: [ :title, :description, :category ],
    using: {
      tsearch: { prefix: true }
    }
end

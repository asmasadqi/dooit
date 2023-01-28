class Activity < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: ["Culture", "Entertainment", "Food", "Sports", "Tours", "Sightseeing", "Outdoors"] }
  validates :localization, presence: true

  before_save :set_image

  include PgSearch::Model

  pg_search_scope :search_by_title_description_category,
    against: [ :title, :description, :category ],
    using: {
      tsearch: { prefix: true }
    }

  CATEGORY_IMAGES = {
    'Culture' => 'https://res.cloudinary.com/dg5wojcq5/image/upload/v1674900566/sightseeing_wcrrm1.jpghttps://res.cloudinary.com/dg5wojcq5/image/upload/v1674900566/artsandculture_xyaipv.jpg',
    'Entertainment' => 'https://res.cloudinary.com/dg5wojcq5/image/upload/v1674900566/entertainment_xwe0qj.jpg',
    'Food' => 'https://res.cloudinary.com/dg5wojcq5/image/upload/v1674900755/food_and_drink_ewcutu.avif',
    'Sports' => 'https://res.cloudinary.com/dg5wojcq5/image/upload/v1674900568/sports_oymyfd.jpg',
    'Tours' => 'https://res.cloudinary.com/dg5wojcq5/image/upload/v1674900567/tours_deywmm_maxhaj.jpg',
    'Sightseeing' => 'https://res.cloudinary.com/dg5wojcq5/image/upload/v1674900566/sightseeing_wcrrm1.jpg',
    'Outdoors' => 'https://res.cloudinary.com/dg5wojcq5/image/upload/v1674900568/outdoors_detmzy.jpg',
  }.freeze

  def set_image
    self.image || CATEGORY_IMAGES[category]
  end
end

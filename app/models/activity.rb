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
    'Culture' => 'app/assets/images/artsandculture.jpg',
    'Entertainment' => 'app/assets/images/entertainment.jpg',
    'Food' => 'app/assets/images/foodanddrink.jpg',
    'Sports' => 'app/assets/images/sports.jpg',
    'Tours' => 'app/assets/images/tours_deywmm.jpg',
    'Sightseeing' => 'app/assets/images/entertainment.jpg',
    'Outdoors' => 'app/assets/images/outdoors.jpg',
  }.freeze

  def set_image
    self.image || self.image = File.open(CATEGORY_IMAGES[category])
  end
end

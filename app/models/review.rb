class Review < ApplicationRecord
  AUTHORIZED_RATINGS = (1..5)

  belongs_to :booking

  validates :rating, inclusion: { in: AUTHORIZED_RATINGS }
  validates :rating, presence: true
end

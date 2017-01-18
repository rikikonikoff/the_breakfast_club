class Review < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..5 }
  validates :body, length: { maximum: 140 }, allow_blank: true
  validates :user_id, presence: true
  validates :dish_id, presence: true
end

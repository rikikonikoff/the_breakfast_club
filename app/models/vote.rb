class Vote < ApplicationRecord
  belongs_to :review
  belongs_to :user

  validates :review_id, presence: true
  validates :user_id, presence: true
  validates :value, presence: true, numericality: true, inclusion: { in: [-1, 0, 1] }
end

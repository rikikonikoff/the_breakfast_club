class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :vote_value, numericality: { only_integer: true }, inclusion: { in: -1..1 }, allow_blank: true
end

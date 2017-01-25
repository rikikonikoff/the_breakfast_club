class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :review, counter_cache: true

  validates :user_id, presence: true
  validates :review_id, presence: true
  # validates :value, numericality: { only_integer: true }, inclusion: { in: -1..1 }, allow_blank: true
end

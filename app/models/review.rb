class Review < ApplicationRecord
  belongs_to :reviewer, class_name: :User
  belongs_to :dish
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes

  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..5 }
  validates :body, length: { maximum: 140 }, allow_blank: true
  validates :reviewer_id, presence: true
  validates :dish_id, presence: true
  validates :upvote_count, numericality: { only_integer: true }, presence: true
  validates :downvote_count, numericality: { only_integer: true }, presence: true
  validates :net_votes, numericality: { only_integer: true }, presence: true
end

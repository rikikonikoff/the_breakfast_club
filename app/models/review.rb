class Review < ApplicationRecord
  belongs_to :reviewer, class_name: :User
  belongs_to :dish
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes

  validates :rating, presence: true, numericality: { only_integer: true }
  validates_inclusion_of :rating, in: 1..5, message: "must be between 1 and 5"
  validates :body, length: { maximum: 140 }, allow_blank: true
  validates :reviewer_id, presence: true
  validates :dish_id, presence: true


  def votes_total
    if self.votes.nil?
      return 0
    else
      votes_arr = self.votes.map { |v| v.value  }
      total = votes_arr.inject(:+)
    end
  end
end

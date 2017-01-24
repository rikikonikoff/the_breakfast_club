class Dish < ApplicationRecord
  belongs_to :creator, class_name: :User
  has_many :reviews, dependent: :destroy
  has_many :reviewers, class_name: :User, through: :reviews

  validates :name, presence: true

  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end

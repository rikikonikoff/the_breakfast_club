class Dish < ApplicationRecord
  belongs_to :creator, class_name: :User
  has_many :reviews
  has_many :users, through: :reviews

  validates :name, presence: true

  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end

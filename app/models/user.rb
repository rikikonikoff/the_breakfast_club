class User < ApplicationRecord
  has_many :created_dishes, class_name: :Dish
  has_many :created_reviews, class_name: :Review
  has_many :dishes, through: :reviews
  has_many :votes
  has_many :reviews, through: :votes

  validates :username, presence: true
  validates :email, presence: true
  validates_format_of :email, :with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable
end

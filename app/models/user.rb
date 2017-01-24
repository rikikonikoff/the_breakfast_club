class User < ApplicationRecord
  attr_accessor :login, :avatar, :avatar_cache, :remove_avatar

  has_many :created_dishes, class_name: :Dish
  has_many :created_reviews, class_name: :Review
  has_many :dishes, through: :created_reviews
  has_many :votes, dependent: :destroy
  has_many :reviews, through: :votes

  validates :username, presence: true
  validates :email, presence: true
  validates_format_of :email, :with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :admin, inclusion: { in: [true, false] }

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  mount_uploader :avatar, AvatarUploader

  def make_admin!
    self.update_attribute(:admin, true)
  end

  def revoke_admin!
    self.update_attribute(:admin, false)
  end
end

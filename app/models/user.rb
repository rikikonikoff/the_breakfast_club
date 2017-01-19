class User < ApplicationRecord
  attr_accessor :login, :avatar, :avatar_cache, :remove_avatar

  has_many :created_dishes, class_name: :Dish
  has_many :reviews
  has_many :dishes, through: :reviews

  validates :username, presence: true
  validates :email, presence: true
  validates_format_of :email, :with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  mount_uploader :avatar, AvatarUploader
end

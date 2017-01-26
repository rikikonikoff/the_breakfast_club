class Dish < ApplicationRecord
  attr_accessor :login, :image, :image_cache, :remove_image

  belongs_to :creator, class_name: :User
  has_many :reviews, dependent: :destroy
  has_many :reviewers, class_name: :User, through: :reviews

  validates :name, presence: true

  mount_uploader :image, ImageUploader

  def self.search(search)
    where("name ILIKE :search OR description ILIKE :search", search: "%#{search}%")
  end
end

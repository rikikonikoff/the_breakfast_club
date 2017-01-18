class Dish < ApplicationRecord
  belongs_to :creator, class_name: :user

  validates :name, presence: true
end

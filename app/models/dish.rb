class Dish < ApplicationRecord
  belongs_to :creator, class_name: :User

  validates :name, presence: true
end

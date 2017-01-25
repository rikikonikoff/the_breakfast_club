class DishSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :creator
  has_many :reviews
end

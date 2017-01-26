class DishSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :creator, :image
  has_many :reviews
end

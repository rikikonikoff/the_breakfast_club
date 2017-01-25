class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :dish_id, :reviewer, :rating, :body
end

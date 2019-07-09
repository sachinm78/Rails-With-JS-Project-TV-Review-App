class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :show_id, :rating, :comment

  belongs_to :user
  belongs_to :show
end

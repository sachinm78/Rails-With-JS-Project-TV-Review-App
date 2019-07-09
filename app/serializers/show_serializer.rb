class ShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :genre

  has_many :reviews
  has_many :users, through: :reviews
end

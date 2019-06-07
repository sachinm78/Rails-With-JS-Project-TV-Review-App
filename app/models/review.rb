class Review < ApplicationRecord
  belongs_to :user
  belongs_to :show

  validates :rating, :numericality => { :less_than_or_equal_to => 5 }
end

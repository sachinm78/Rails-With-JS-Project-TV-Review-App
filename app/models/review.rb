class Review < ApplicationRecord
  belongs_to :user
  belongs_to :show

  validates :rating, :numericality => { :less_than_or_equal_to => 5 }

  def self.five_stars
    all.where("rating = ?", 5)
  end

  def self.not_rated
    all.where("comment = ?", "Add a comment.") 
  end

  def next
    review = Review.where("id > ?", id).first

    if review
      review
    else
      Post.first
    end
  end

end

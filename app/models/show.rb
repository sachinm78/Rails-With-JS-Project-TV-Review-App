class Show < ApplicationRecord
    has_many :reviews, :dependent => :destroy
    has_many :users, through: :reviews

    validates :title, :genre, presence: true

end

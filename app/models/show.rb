class Show < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    validates :title, :genre, presence: true

end

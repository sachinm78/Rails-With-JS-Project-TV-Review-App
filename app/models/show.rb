class Show < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    validates :title, :genre, presence: true

    def status=(status)
        status = 'P'
        write_attribute(:status, status)
    end
end

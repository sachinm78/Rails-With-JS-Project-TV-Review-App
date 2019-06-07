class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    def welcome
        @user = current_user
        @shows = Show.all
        @reviews = Review.all
    end
end


# add reviews to shows data base 
# - <%= show.reviews.first.rating %> - <%= show.reviews.first.comment %>
# works in pry but getting nilclass error on server
class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    def welcome
        @user = current_user
        @shows = Show.all
        @reviews = Review.all
    end

    def index
        @shows = Show.all
        respond_to do |f|
            f.html {render :root}
            f.json {render json: @shows}
        end
    end
end
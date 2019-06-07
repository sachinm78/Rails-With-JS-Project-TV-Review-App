class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    def welcome
        @user = current_user
        @shows = Show.all
    end
end
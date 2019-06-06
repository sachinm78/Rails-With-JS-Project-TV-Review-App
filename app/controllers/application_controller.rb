class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    def welcome
        @user = current_user
    end
end

class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    def welcome
        @user = current_user
        @shows = Show.all
        @reviews = Review.all
        respond_to do |f|
            f.html {render :welcome}
            f.json {render json: @shows, each_serializer: ShowSerializer, root: 'application#welcome'}
        end
    end

end
class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    def welcome
        get_data
        respond_to do |f|
            f.html {render :welcome}
            f.json {render json: @shows, each_serializer: ShowSerializer, root: 'application#welcome'}
        end
    end

    def show 
        get_data
        find_review
        respond_to do |f|
            f.html {render :welcome}
            f.json {render json: @review, each_serializer: ReviewSerializer, root: 'application#welcome'}
        end
    end

    def next
        get_data
        find_review
    end

    private

    def get_data
        @user = current_user
        @shows = Show.all
        @reviews = Review.all
    end

    def find_review
        @review = Review.find_by(id: params[:id])
    end

end
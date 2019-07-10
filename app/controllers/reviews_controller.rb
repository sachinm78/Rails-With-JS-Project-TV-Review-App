class ReviewsController < ApplicationController
    before_action :authenticate_user!
    
  
    def index
        @user = current_user
        @reviews = Review.all
        respond_to do |f|
            f.html {render :index}
            f.json {render json: @reviews}
        end
    end

    def create
        @review = Review.create(user_id: current_user.id, shown_id: params[:show_id])
        if @review
            redirect_to reviews_path(@review)
        else
            render :show
        end
    end

    def edit
        find_review
        if current_user.reviews.include?(@review)
            render :edit
        else 
            redirect_to reviews_path
        end
    end

    def update
        find_review
        @review.update(review_params)
        redirect_to reviews_path(@review)
    end

    def show
        custom_query
        render :custom_query
    end

    def custom_query
        special_index
    end 
    
    def special_index
        @user = current_user
        @reviews = Review.all
        five_stars = @reviews.five_stars
        not_rated = @reviews.not_rated
    end

    def find_review
        @review = Review.find_by(id: params[:id])
    end
      
private

    def review_params
        params.require(:review).permit(:rating, :comment)
    end

end
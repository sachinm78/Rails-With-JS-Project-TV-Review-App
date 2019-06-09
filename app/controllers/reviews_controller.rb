class ReviewsController < ApplicationController
    before_action :authenticate_user!
    
  
    def index
        @user = current_user
        @reviews = Review.all
        five_stars = @reviews.five_stars
        not_rated = @reviews.not_rated
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
        @review = Review.find_by(id: params[:id])
        if current_user.reviews.include?(@review)
            render :edit
        else 
            redirect_to reviews_path
        end
    end

    def update
        @review = Review.find_by(id: params[:id])
        @review.update(review_params)
        redirect_to reviews_path(@review)
    end

    def show
        custom_query
        render :custom_query
    end

    def custom_query
        @user = current_user
        @reviews = Review.all
        five_stars = @reviews.five_stars
        not_rated = @reviews.not_rated
    end    
      
private

    def review_params
        params.require(:review).permit(:rating, :comment)
    end

end
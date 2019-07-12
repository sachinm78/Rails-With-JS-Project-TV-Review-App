class ReviewsController < ApplicationController
    before_action :authenticate_user!
    
  
    def index
        special_index
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
        @user = current_user
        if current_user.reviews.include?(@review)
            render :edit
        else 
            redirect_to reviews_path
        end
    end

    def update
        find_review
        @user = current_user
        @review.update(review_params)
        redirect_to reviews_path(@review)
    end

    def next
        find_review
        @show = Show.find_by(id: params[:id])
        @user = current_user
        @next_review = @review.next
        render json: @next_review
    end
    
    def show
        find_review
        @show = Show.find_by(id: params[:id])
        @user = current_user
        respond_to do |f|
          f.html {render :show}
          f.json {render json: @review}
        end
    end

    def custom_query
        special_index
    end 
        
private

    def review_params
        params.require(:review).permit(:rating, :comment)
    end

    def find_review
        @review = Review.find_by(id: params[:id])
    end

    def special_index
        @user = current_user
        @reviews = current_user.reviews
        five_stars = @reviews.five_stars
        not_rated = @reviews.not_rated
    end
end
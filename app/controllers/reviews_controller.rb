class ReviewsController < ApplicationController::Base

    def index
        @reviews = Review.all
    end

    def new
        @review = review.new
    end

    def create
        @review = Review.create(review_params)
        if @review
            redirect_to user_review_path(@review)
        else
            render :new
        end
    end

    def show
        @review = Review.find_by(id: params[:id])
    end

    def edit
    end

    def update
        @review.update(review_params)
        if @review.save
            redirect_to user_review_path(@review)
        else
            render :edit
        end
    end

private
    
    def review_params
        params.require(:review).permit(:rating, :comment)
    end

end
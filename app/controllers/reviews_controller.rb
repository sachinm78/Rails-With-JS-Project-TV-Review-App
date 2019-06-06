class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end

    def new
        @review = Review.new
    end

    def create
        @review = Review.create(review_params)
        if @review
            redirect_to reviews_path(@review)
        else
            render :new
        end
    end

    def show
        @review = Review.find_by(id: params[:id])
    end

    def edit
        @review = Review.find_by(id: params[:id])
    end

    def update
        @review.update(review_params)
        if @review.save
            redirect_to reviews_path(@review)
        else
            render :edit
        end
    end

    def destroy
        @review = Review.find_by(id: params[:id])
        @review.destroy
        redirect_to reviews_path
    end

private
    
    def review_params
        params.require(:review).permit(:rating, :comment)
    end

end
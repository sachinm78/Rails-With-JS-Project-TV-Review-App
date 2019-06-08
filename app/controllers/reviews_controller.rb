class ReviewsController < ApplicationController
    before_action :authenticate_user!
    
  
    def index
        @user = current_user
        @reviews = Review.all
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

    def destroy
        @review = Review.find_by(id: params[:id])
        @review.destroy
        redirect_to reviews_path
    end

private

    def review_params
        params.require(:review).permit(:rating, :comment)
    end

    # def default_values
    #     self.rating = 0 if self.rating.nil?
    #     self.comment = "blank" if self.comment.nil?
    # end

end
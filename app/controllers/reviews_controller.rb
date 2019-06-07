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

    def show
        @review = Review.find_by(id: params[:id])
    end

    def edit
        @review = Review.find_by(id: params[:id])
    end

    def update
        if user_id == current_user.id
            @review.update(user_id: current_user.id, shown_id: params[:show_id])
            @review.save
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

end
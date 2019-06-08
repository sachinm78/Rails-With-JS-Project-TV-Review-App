class ShowsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @shows = Show.all
        @user = current_user
        @reviews = current_user.reviews
    end

    def new
        @show = Show.new
        @user = current_user
    end

    def create
        @show = Show.new(show_params)
        user = User.find_by(id: params[:user_id])
        @user = (user == current_user ? user : current_user)
        if @show.save
            @show.reviews.create(user_id: @user.id)    
            redirect_to edit_review_path(@show)
        else
            render :new
        end
    end

    def show
        @show = Show.find_by(id: params[:id])
        @user = current_user
        @reviews = current_user.reviews
    end

    def edit
        @show = Show.find_by(id: params[:id])
        @user = User.find_by(id: params[:user_id])
        if !@user.shows.include?(@show)
            redirect_to user_shows_path(current_user)
        end
    end

    def update
        @show = Show.find_by(id: params[:id])
        @show.update(show_params)
        user = User.find_by(id: params[:user_id])
        @user = (user == current_user ? user : current_user)
        if @show.save
            redirect_to user_show_path(@show)
        else
            render :edit
        end
    end

    def destroy
        user = User.find_by(id: params[:user_id])
            if user == current_user
                user.shows.find_by(id: params[:id]).destroy
            end
        redirect_to user_shows_path 
    end

     

private
    
    def show_params
        params.require(:show).permit(:title, :genre)
    end
    
end
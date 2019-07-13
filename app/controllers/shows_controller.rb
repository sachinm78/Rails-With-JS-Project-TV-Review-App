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
        find_user
        @user = (@user == current_user ? @user : current_user)
        @show.save    
        if @show.save
            @show.reviews.create(user_id: @user.id)
            render json: @show
        else
            render :new
        end
    end

    def show
        find_show
        @user = current_user
        @reviews = current_user.reviews
    end
    
    def edit
        find_show
        find_user
        if !@user.shows.include?(@show)
            redirect_to user_shows_path(current_user)
        end
    end

    def update
        find_show
        @show.update(show_params)
        find_user
        @user = (@user == current_user ? @user : current_user)
        if @show.save
            redirect_to user_show_path(@show)
        else
            render :edit
        end
    end

    def destroy
        @user = current_user
        find_show.destroy
        
        redirect_to user_shows_path 
    end

private
    
    def show_params
        params.require(:show).permit(:title, :genre)
    end

    def find_user
        @user = User.find_by(id: params[:user_id])
    end

    def find_show
        @show = Show.find_by(id: params[:id])
    end
    
end
class ShowsController < ApplicationController

    def index
        @shows = Show.all
    end

    def new
        @show = Show.new
    end

    def create
        @show = Show.create(show_params)
        if @show
            redirect_to user_show_path(@show)
        else
            render :new
        end
    end

    def show
        @show = Show.find_by(id: params[:id])
    end

    def edit
        @show = Show.find_by(id: params[:id])
    end

    def update
        @show.update(show_params)
        if @show.save
            redirect_to user_show_path(@show)
        else
            render :edit
        end
    end

    def destroy
        @show = Show.find_by(id: params[:id])
        @show.destroy
        redirect_to user_show_path
    end

private
    
    def show_params
        params.require(:show).permit(:title, :genre)
    end
    
end
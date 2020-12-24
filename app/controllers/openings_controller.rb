class OpeningsController < ApplicationController
    before_action :require_user
    def index
        @openings=Opening.all
    end

    def show
        @opening=Opening.find(params[:id])
    end

    def new
        @opening=Opening.new
    end

    def create
        @opening=Opening.new(opening_params)

        if @opening.save
            redirect_to @opening
        else
            render :new
        end
    end

    def edit
        @opening=Opening.find(params[:id])
    end

    def update
        @opening=Opening.find(params[:id])

        if @opening.update(opening_params)
            redirect_to @opening
        else
            render :edit
        end
    end

    def destroy
        @opening = Opening.find(params[:id])
        @opening.destroy

        redirect_to openings_path
    end

    private
    def opening_params
      params.require(:opening).permit(:title, :description)
    end
end

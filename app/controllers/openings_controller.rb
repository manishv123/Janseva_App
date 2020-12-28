class OpeningsController < ApplicationController
    before_action :require_user
    before_action :check_uuid
    def index
        @openings=Opening.all
    end

    def show
        @opening=Opening.find(params[:id])
    end

    def new
        if current_user.admin?
            @opening=Opening.new
        else
            flash[:danger]="Login as Admin first"
            redirect_to openings_path
        end
    end

    def create
        if current_user.admin?
            @opening=Opening.new(opening_params)

            if @opening.save
                redirect_to @opening
            else
                render :new
            end
        else
            flash[:danger]="Login as Admin first"
            redirect_to openings_path
        end
    end

    def edit
        if current_user.admin?
        @opening=Opening.find(params[:id])
        else
        flash[:danger]="Login as Admin first"
        redirect_to openings_path
        end
    end

    def update
        if current_user.admin?
        @opening=Opening.find(params[:id])

        if @opening.update(opening_params)
            redirect_to @opening
        else
            render :edit
        end
    else
        flash[:danger]="Login as Admin first"
        redirect_to openings_path
    end
    end

    def destroy
        if current_user.admin?
        @opening = Opening.find(params[:id])
        @opening.destroy
        redirect_to openings_path
        else
        flash[:danger]="Login as Admin first"
        redirect_to openings_path
        end
    end

    private
    def opening_params
      params.require(:opening).permit(:title, :description)
    end
end

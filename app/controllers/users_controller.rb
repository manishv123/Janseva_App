class UsersController < ApplicationController
   before_action :set_user,only: [:edit,:update,:show]
    def index
        @users=User.all
    end

    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params)
        if @user.save
            flash[:success]="Successfully Signed Up"
            redirect_to root_path
        else
            render 'new'
        end
    end

    def edit
        @user=User.find(params[:id])
    end

    def update
        @user=User.find(params[:id])
        if @user.update(user_params)
            flash[:success]="Successfully Updated" 
            redirect_to root_path
        else
            render 'edit'
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
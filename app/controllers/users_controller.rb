class UsersController < ApplicationController
   before_action :set_user,only: [:edit,:update,:show]
   before_action :require_user,except: [:create,:new]
    def index
        @users=User.all
    end

    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params)
        if @user.save
            session[:user_id]=@user.id
            flash[:success]="Successfully Signed Up"
            redirect_to new_userdetail_path
        else
            render 'new'
        end
    end

    def edit
       
    end

    def update

        if @user.update(user_params)
            flash[:success]="Successfully Updated" 
            redirect_to root_path
        else
            render 'edit'
        end
    end

    def show

    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    def set_user
        @user=User.find(params[:id])
        @userdetail=Userdetail.find(params[:id])
    end
end
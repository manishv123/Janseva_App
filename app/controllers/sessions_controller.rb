class SessionsController < ApplicationController
    def new
    end
    def create
        user=User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id]=user.id
            flash[:success]="Login Successfull"
            redirect_to root_path
        else
            flash.now[:danger]="Wrong Details Entered"
            render 'new'
        end
    end

    def destroy
        session[:user_id]=nil
        flash[:success]="You have been logged out successfully"
        redirect_to root_path
    end
end
class ApplicationController < ActionController::Base
    helper_method :current_user,:logged_in?
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    def logged_in?
        !!current_user
    end
    def require_user
        if !logged_in?
            flash[:danger]="Login first"
            redirect_to root_path
        end
    end
    def check_uuid
        if !current_user.usid? && !current_user.admin?
            flash[:danger]="Add Details First"
            redirect_to new_userdetail_path
        end
    end
end

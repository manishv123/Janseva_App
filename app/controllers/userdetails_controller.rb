class UserdetailsController < ApplicationController
    before_action :require_user
    before_action :set_userdetails,only: [:edit,:update,:show]
    def new
        @userdetail=Userdetail.new
    end
    def create    
    @userdetail=Userdetail.new(userdetail_params)
    @userdetail.uuid=current_user.id;
            if @userdetail.save
                @current_user.usid=@userdetail.id;
                if @current_user.save
                flash[:success]="Successfully Added Details"
                redirect_to root_path
                end
            else
                render :new
            end
    end

    def edit
       
    end
    def show

    end
    def update
        if @userdetail.update(userdetail_params)
            flash[:success]="Successfully Updated" 
            redirect_to root_path
        else
            render 'edit'
        end
    end

    private
    def userdetail_params
        params.require(:userdetail).permit(:name, :gender, :age, :address, :pincode, :phone, :aadhaar)
    end
    def set_userdetails
        @userdetail=Userdetail.find(params[:id])
    end
end
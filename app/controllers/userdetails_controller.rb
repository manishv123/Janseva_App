class UserdetailsController < ApplicationController
    before_action :require_user
    def new
        @userdetails=Userdetail.new
    end
    def create    
    @userdetail=Userdetail.new(userdetail_params)
    @userdetail.uuid=current_user.id;
            if @userdetail.save
                flash[:success]="Successfully Applied"
                redirect_to root_path
            else
                render :new
            end
    end
    private
    def userdetail_params
        params.require(:userdetail).permit(:name, :gender, :age, :address, :pincode, :phone, :aadhaar)
    end
end
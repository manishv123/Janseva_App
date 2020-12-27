class OpportunitiesController < ApplicationController
    def new
        @opportunity=Opportunity.new
    end

    def applyForm
        @temp = Opportunity.where(:uid => current_user.id)
        if(!@temp.where(:opid => params[:format]).exists?)
            @opportunity=Opportunity.new(uid:current_user.id,opid:params[:format],status:false)
            if @opportunity.save
                redirect_to openings_path
            else
                render :new
            end
        else
            flash[:danger]="Already Applied"
        end
    end
end

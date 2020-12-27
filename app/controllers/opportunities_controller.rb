class OpportunitiesController < ApplicationController
    def new
        @opportunity=Opportunity.new
    end

    def applyForm
            @opportunity=Opportunity.new(uid:current_user.id,opid:params[:format],status:false)
            if @opportunity.save
                flash[:success]="Successfully Applied"
                redirect_to openings_path
            else
                render :new
            end
    end
end

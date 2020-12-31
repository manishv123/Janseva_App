class OpportunitiesController < ApplicationController
    def new
        @opportunity=Opportunity.new
    end

    def applyForm
            @opportunity=Opportunity.new(uid:current_user.id,opid:params[:format],status:false)
            if @opportunity.save
                flash[:success]="Successfully Applied"
                redirect_to opening_path(params[:format])
            else
                render :new
            end
    end

    def withdraw
         Opportunity.where(:opid=>params[:format]).where(:uid=>current_user.id).destroy_all
         redirect_to opening_path(params[:format])
         flash[:success]="Withdrawn successfully"
    end

    def approveApplication
        @opportunity = Opportunity.find(params[:format])
        @openingid=@opportunity.opid
        if @opportunity.update_attribute(:status, true)
            redirect_to opening_path(@openingid)
        end
    end

    def rejectApplication
        @opportunity = Opportunity.find(params[:format])
        @openingid=@opportunity.opid
        @opportunity.destroy
        redirect_to opening_path(@openingid)
    end

    def showDetails
        @userID=params[:format]
    end

end

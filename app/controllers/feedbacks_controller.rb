class FeedbacksController < ApplicationController
    def create
        @opening = Opening.find(params[:opening_id])
        @feedback = @opening.feedbacks.create(feedback_params)
        redirect_to opening_path(@opening)
      end
    
    private
    def feedback_params
        allowedParams=params.require(:feedback).permit(:body,:uid)
        allowedParams[:uid]=current_user.id
        allowedParams
    end
end

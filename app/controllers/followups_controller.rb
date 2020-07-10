class FollowupsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @inquiry = Inquiry.find(params[:inquiry_id])
    @followup = @inquiry.followups.create(followup_params)
    
    redirect_to inquiry_path(@inquiry)
  end

  def destroy
    @inquiry = Inquiry.find(params[:inquiry_id])
    @followup = @inquiry.followups.create(followup_params)
    @followup.destroy
    
    redirect_to inquiry_path(@inquiry)
  end

  private

  def followup_params
    params.require(:followup). permit(:commenter, :body)
  end

end

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






  # # POST /admin/log_in
	# def log_in

	# 	param! :email, String, required: true
	# 	param! :password, String, required: true
	# 	param! :expires, :boolean, required: true
	
	# 	@admin = Admin.find_by_email(params[:email])
			
	# 	if @admin&.authenticate(params[:password])
	# 		render json: {
	# 			token: JsonWebToken.encode(admin_id: @admin.id),
	# 			refresh: JsonWebToken.refresh_token(@admin.id, params[:expires]) ,
	# 			id: @admin.id,
	# 			role: @admin.super_admin ? "super_admin" : "admin" 
	# 		}, status: :ok
	# 	else
	# 		head :unauthorized
	# 	end
	# end



  private

  def followup_params
    params.require(:followup). permit(:commenter, :body)
  end

end

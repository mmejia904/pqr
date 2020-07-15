class AdminController < ApplicationController
  before_action :authenticate_and_set_admin, only: %i[show update]
  before_action :set_admin, only: %i[show update destroy]
  before_action :set_inquiry, only: %i[create]


	def index
		render json: Admin.all, status: :ok
	end

	# POST /admin
	def create
		admin = @inquiry.admins.build(admin_params)

		if admin.save
      render json: admin, status: :created
	  else
	    render json: admin.errors, state: :unprocessable_entity
	  end
	end   
	  
	# GET /admin/{id}
	def show
		render json: @admin, status: :ok
	end

  # PATCH/PUT /admin/{id}
	def update
		if @admin.update(admin_params)
			render json: @admin, status: :ok
		else
			render json: @admin.errors, status: :unprocessable_entity
		end
	end


	# DELETE /admin/{id}
	def destroy
		@admin.destroy
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
	def admin_params
		params.permit(:email, :description, :password, :password_confirmation, :super_admin, :active, :zone_id)
	end

	def set_admin
		begin
			@admin = Admin.find(params[:id])
		rescue
			render json: {error: "there is no admin with id #{params[:id]}"}, status: :not_found
		end
  end
  
  def set_inquiry
		begin
			@inquiry = Inquiry.find(params[:inquiry_id])
		rescue
			render json: {error: "there is no inquiry with id #{params[:inquiry_id]}"}, status: :not_found
		end
	end

end

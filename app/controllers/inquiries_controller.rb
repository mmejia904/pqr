class InquiriesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @inquiry = Inquiry.all
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end
  
  def new 
    @inquiry = Inquiry.new
  end

  def edit
    @inquiry = Inquiry.find(params[:id])
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      redirect_to @inquiry
    else
      render 'new'
    end
  end

  def update
    @inquiry = Inquiry.find(params[:id])

    if @inquiry.update(inquiry_params)
      redirect_to @inquiry
    else
      render 'edit'
    end
  end

  def destroy
    @inquiry = Inquiry.find(params[:id])
    @inquiry.destroy

    redirect_to inquiries_path
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:subject, :description, :customer_id, :admin_id, :status)
  end

end
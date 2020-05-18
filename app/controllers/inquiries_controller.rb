class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      render :confirm
    else
      render :new
    end
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if params[:back]
      render :new
    else
      InquiryMailer.inquiry_mail(@inquiry).deliver_now
      @inquiry.save
      redirect_to :root
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :content)
  end
end

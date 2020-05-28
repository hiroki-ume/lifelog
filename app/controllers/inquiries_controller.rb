class InquiriesController < ApplicationController
  # お問い合わせ一覧
  def index
    @inquiries = Inquiry.all
  end

  # 新規お問い合わせ入力
  def new
    @inquiry = Inquiry.new
  end

  # お問い合わせ内容確認画面
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

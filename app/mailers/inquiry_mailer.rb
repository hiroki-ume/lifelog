class InquiryMailer < ApplicationMailer
  def inquiry_mail(content)
    @inquiry = content
    mail(subject: 'lifelog利用者からのお問い合わせがあります。',
      to: ENV['RECEIVE_ADDRESS'])
  end
end

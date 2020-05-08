class DailyMailer < ApplicationMailer
   default from: 'no-replay@gmail.com'

   def send_daily_mail(user)
     @user = user
     @posts = @user.posts.where(send_mail: true)

     mail subject: "#{@user.name}さんの今日のやることリスト",
      to: @user.email
   end
end

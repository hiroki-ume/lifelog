class DailyMailer < ApplicationMailer
  default from: 'no-replay@gmail.com'

  def send_updated_mail(user)
    @user = user
    @posts = @user.posts.where(send_mail: true)
    mail subject: "#{@user.name}さんのやることリストが更新されました",
    to: @user.email
  end

  def send_daily_mail(user)
    @user = user
    @posts = @user.posts.where(send_mail: true)
    mail subject: "#{@user.name}さんのやることリストです",
      to: user.email
  end

  def self.send_daily_mail_users
    @users = User.all
    @users.each do |user|
      send_daily_mail(user).deliver_now
    end
  end
end

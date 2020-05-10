class HomesController < ApplicationController
  def top
    @user = current_user
    @posts = @user.posts.all.order(id: "DESC") if @user_signed_in
  end

  def about

  end
end

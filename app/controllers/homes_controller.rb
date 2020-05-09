class HomesController < ApplicationController
  def top
    @user = current_user
    @posts = @user.posts.all.order(id: "DESC") 
  end

  def about

  end
end

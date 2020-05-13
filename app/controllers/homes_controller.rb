class HomesController < ApplicationController
  def top
    @posts = current_user.posts.all.order(id: "DESC") if user_signed_in?
  end

  def about

  end
end

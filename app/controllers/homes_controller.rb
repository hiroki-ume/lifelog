class HomesController < ApplicationController
  def top
    @posts = current_user.posts.all.order(id: "DESC")
  end
end

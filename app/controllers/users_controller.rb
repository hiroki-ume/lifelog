class UsersController < ApplicationController
  def show
    @posts = current_user.posts.all
  end

  def edit
  end
end

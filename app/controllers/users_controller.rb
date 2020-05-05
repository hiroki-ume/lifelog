class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
  end

  def edit
  end
end

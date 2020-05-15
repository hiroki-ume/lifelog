class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all.order(id: "DESC")
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to :user
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :introduce, :profile_image)
  end
end

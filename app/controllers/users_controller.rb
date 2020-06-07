class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # マイページとログインユーザーが一致する場合のみ非公開の投稿を表示する
    if @user == current_user
      @posts = @user.posts.all.order(id: "DESC")
    else
      @posts = @user.posts.publishable.order(id: :desc)
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduce, :profile_image, :send_mail)
  end
end

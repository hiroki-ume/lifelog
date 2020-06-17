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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user
      @user.update(user_params)
      flash[:notice] = "会員情報を変更しました。"
      redirect_to @user
    else
      flash[:notice] = "ユーザーが違います。"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduce, :profile_image, :send_mail)
  end
end

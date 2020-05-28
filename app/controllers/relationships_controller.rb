class RelationshipsController < ApplicationController
  # フォローする
  def create
    current_user.follow(params[:user_id])
    redirect_back(fallback_location: root_path)
  end

  # フォロー解除する
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_back(fallback_location: root_path)
  end

  def follower
    @user = User.find(params[:user_id])
  end

  def followed
    @user = User.find(params[:user_id])
  end
end

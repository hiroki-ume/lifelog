class RelationshipsController < ApplicationController
  def create
    current_user.follow(params[:user_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_back(fallback_location: root_path)
  end

  def follower
    @user = User.find(params[:user_id])
  end

  def follower_posts
    @user = User.find(params[:user_id])
    @follower = @user.following_user
    @follower_posts = Post.where(user_id: @follower).order(created_at: 'DESC')
  end

  def followed
    @user = User.find(params[:user_id])
  end
end

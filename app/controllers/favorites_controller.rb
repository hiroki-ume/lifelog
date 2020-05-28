class FavoritesController < ApplicationController
  before_action :set_post

  # いいねしたユーザーの一覧画面
  def index
    @favorites = @post.favorites.all
  end

  # いいね
  def create
    @favorite = current_user.favorites.new(post_id: @post.id)
    @favorite.save
    flash[:success] = "いいねしました"
  end

  # いいね取り消し
  def destroy
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @favorite.destroy
    flash[:notice] = "いいね を取り消しました"
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end

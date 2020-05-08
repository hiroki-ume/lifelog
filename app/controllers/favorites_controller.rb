class FavoritesController < ApplicationController
  before_action :set_post

  def index
    @favorites = @post.favorites.all
  end

  def create
    @favorite = current_user.favorites.new(post_id: @post.id)
    @favorite.save
    flash[:success] = "いいねしました"
  end

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

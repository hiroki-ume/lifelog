class PostsController < ApplicationController

  def index
    @posts = Post.publishable.page(params[:page]).reverse_order
    @new_post = Post.new
    @genres = Genre.all
  end

  # いいねした記事を一覧表示する
  def favorite_posts
    @user = current_user
    @favorites = @user.favorites.all
  end

  # フォローユーザーの投稿を一覧表示する
  def follower_posts
    @user = User.find(params[:user_id])
    @follower = @user.following_user
    @follower_posts = Post.where(user_id: @follower, publish_status: 1).order(created_at: 'DESC')
  end

  # いいねの数順で一覧表示する
  def ranking
    #いいねをpost別で分けて、idの合計順に並べ、post_idを@favoritesに配列で代入
    @favorites = Favorite.group(:post_id).order('count(id) DESC')
      .pluck(:post_id)
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
    @all_comments = @post.comments.all
  end

  def new
    @post = Post.new(publish_status: "publish", send_mail: true)
    @genres = Genre.where(is_valid: true)
  end

  def create
    @post = current_user.posts.new(post_params)
    @genres = Genre.all
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to :posts
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.all
    if @post.user_id != current_user
      flash[:notice] = "権限がありません"
      redirect_to @post
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      if @post.update(post_params)
        DailyMailer.send_updated_mail(current_user).deliver
        redirect_to @post
      else
        render :edit
      end
    else
      flash[:notice] = "権限がありません"
      redirect_to @post
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.destroy
      redirect_to user_path(current_user)
    else
      flash[:notice] = "ユーザー以外は削除できません！"
      render :posts
    end
  end

  # 検索機能
  def search
    @posts = Post.search(params[:q]).where(publish_status: "publish").page(params[:page])
    render "index"
  end

  private

  def post_params
    params.require(:post).permit(:source, :word, :action, :genre_id, :send_mail, :publish_status)
  end
end

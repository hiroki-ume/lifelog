class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page]).reverse_order
    # .page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
    @all_comments = @post.comments.all
  end

  def new
    @post = Post.new
    @genres = Genre.all
  end

  def create
    @post = current_user.posts.new(post_params)
    @genres = Genre.all
    if @post.save
      flash[:success] = "Your post up to the world!"
      redirect_to :posts
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      # DailyMailer.send_updated_mail(current_user).deliver_now
      @user = User.all
      @user.each do |user|
        DailyMailer.send_daily_mail(user).deliver_now
      end
      flash[:success] = "Success!"
      redirect_to @post
    else
      render :edit
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

  private
    def post_params
      params.require(:post).permit(:source, :word, :action, :genre_id, :send_mail)
    end
end

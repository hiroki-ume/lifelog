class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC")
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
      flash[:success] = "Success!"
      redirect_to :posts
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.destroy
      redirect_to :posts
    else
      flash[:notice] = "ユーザー以外は削除できません！"
      render :posts
    end
  end

  private
    def post_params
      params.require(:post).permit(:source, :word, :action, :genre_id)
    end

    def mailer

    end
end

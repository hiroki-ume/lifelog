class PostsController < ApplicationController
  def index
    @posts = current_user.posts.all
  end

  def show
  end

  def new
    @post = Post.new
    @genres = Genre.all
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = "Your post up to the world!"
      redirect_to :index
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

  private
    def post_params
      params.require(:post).permit(:source, :word, :action, :genre_id)
    end
end

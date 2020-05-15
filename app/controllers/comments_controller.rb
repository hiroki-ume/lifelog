class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @post
    else
      flash[:alert] = "内容を入力または文字数を１４０文字以下にしてください"
      redirect_to post_path(@post)
    end
  end

  # def edit
  #   @post = Post.find(params[:post_id])
  #   @comment = Comment.find(params[:post_id])
  # end

  def destroy
    comment = Comment.find(params[:post_id])
    if comment.user == current_user
      comment.destroy
      redirect_back(fallback_location: root_path)
    else
      render post_path(post_id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

class HomesController < ApplicationController
  # トップページ
  def top
    @posts = current_user.posts.all.order(id: "DESC") if user_signed_in?
  end

  # このサイトについて
  def about
  end
end

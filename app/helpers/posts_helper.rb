module PostsHelper
  # サイドバーに現在表示中のリンクを表示する
  def page_point(current_page)
    if current_page?(current_page)
      "(SHOWING NOW)"
    end
  end
end

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :source, length: {maximum: 50}
  validates :word, presence: true, length: {maximum: 140}
  validates :action, length: {maximum: 100}


  #公開・非公開のenum設定
  enum publish_status: { unpublish: 0, publish: 1}

  #公開trueの投稿のみ取り出すscope
  scope :publishable, -> { where(publish_status: 1) }

  # ユーザーがいいねしてるかを検証するメソッド
  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

  # 検索機能のメソッド
  def self.search(query)
    posts = order(id: 'DESC')
    if query.present?
      posts = posts.where("word LIKE? OR action LIKE? OR source LIKE?",
      "%#{query}%", "%#{query}%", "%#{query}%")
    end
    posts
  end

end

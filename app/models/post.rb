class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  attr_accessor :mailer
  validates :word, presence: true

  #公開・非公開のenum設定
  enum publish_status: { unpublish: 0, publish: 1}
  #公開trueの投稿のみ取り出すscope
  scope :publishable, -> { where(publish_status: 1) }
  

  # いいね されてるかを検証するメソッド
  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(query)
    posts = order(id: 'DESC')
    if query.present?
      posts = posts.where("word LIKE? OR action LIKE? OR source LIKE?",
      "%#{query}%", "%#{query}%", "%#{query}%")
    end
    posts
  end

end

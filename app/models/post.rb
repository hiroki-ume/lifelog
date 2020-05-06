class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  attr_accessor :mailer
  validates :word, presence: true

  # いいね されてるかを検証するメソッド
  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

end

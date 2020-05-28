require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user){ create(:user) }
  let(:post){ Post.create(word: "test", user_id: user.id, genre_id: 1) }

  describe 'コメント機能のテスト' do
    before do
      login_user user
    end
    it "コメントが投稿できる" do
      comment = user.Comment.create(post_id: post.id)
      expect(comment).to be_valid
    end
  end
end

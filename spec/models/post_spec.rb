require 'rails_helper'
RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:genre) { Genre.create(name: "test") }
  let(:post) { user.posts.create(word: "test", user_id: 1, genre_id: genre.id)}

  describe '新規投稿のテスト' do
    context "wordが入力されているとき" do
      it "保存される" do
        expect(post).to be_valid
      end
    end
    context "wordが入力されていない時" do
      before do
        @post = Post.create(word: nil)
      end
      it "保存されない" do
        expect(@post).to be_invalid
      end
    end
  end
end

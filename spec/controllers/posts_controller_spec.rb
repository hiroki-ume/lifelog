require 'rails_helper'
RSpec.describe PostsController, type: :controller do
    describe '新規投稿ページのテスト' do
      context "ログインしていない場合" do
        before do
          get :new
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 302
        end
      end
    end
    describe '投稿一覧ページのテスト' do
      before do
        get :index
        post = Post.create(word: "a", action: "a")
      end
      context '表示の確認' do
        it "リクエストは200　OKとなること" do
          expect(response.status).to eq 200
        end
        it "気づきと表示される" do
          expect(response.body).to include("気づき")
        end
        it "自分と他人の名前のリンク先が正しい" do
          expect(response.body).to have_link '', href: user_path(post.user)
          expect(response.body).to have_link '', href: user_path(post2.user)
        end
        it "自分と他人の今日からすることのリンク先が正しい" do
          expect(response.body).to have_link '今日からすること', href: post_path(post)
        end
        it "自分と他人のactionが表示される" do
          expect(response.body).to have_content post.action
        end
      end
    end

    describe '投稿詳細ページのテスト' do
      before do
        get :show
      end
      it "リクエストは200　OKとなること" do
        expect(response.status).to eq 200
      end
    end
end

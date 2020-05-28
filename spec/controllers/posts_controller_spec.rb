require 'rails_helper'
RSpec.describe PostsController, type: :controller do
    let(:post) { create(:post, user_id: user.id) }
    let(:user) { User.create(name: "test", email: "test@test") }

    describe '新規投稿ページのテスト' do
      context "ログインしていない場合" do
        before do
          get :new
        end
        it 'リクエストは302となる' do
          expect(response.status).to eq 302
        end
      end
    end
    describe '投稿一覧ページのテスト' do
      context '表示の確認' do
        before do
          login_user user
          visit '/posts'
        end
        it "リクエストは200　OKとなること" do
          expect(response.status).to eq 200
        end
        it "名前のリンク先が正しい" do
          expect(page).to have_link("#{user.name}", href: user_path(user.id))
        end
        it "今日からすることのリンク先が正しい" do
          expect(page).to have_link '今日からすること', url: post_path(post.id)
        end
        it "自分と他人のactionが表示される" do
          expect(response.body).to have_content post.action
        end
      end
    end

    describe '投稿詳細ページのテスト' do
      before do
        post = create(:post)
        get :show, id: post
      end
      it "リクエストは200　OKとなること" do
        expect(response.status).to eq 200
      end
    end
end

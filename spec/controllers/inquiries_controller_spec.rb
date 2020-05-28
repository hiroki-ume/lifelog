require 'rails_helper'
RSpec.describe InquiriesController, type: :controller do
  let(:user) { create(:user) }
  let(:inquiry) { create(:inquiry) }

  describe 'お問い合わせ機能' do
    before do
      login_user(user)
    end
    describe '表示のテスト' do
      it "新規お問い合わせページに遷移できる" do
        get :new
        expect(response).to render_template :new
      end
      it "入力に失敗する" do
        visit new_inquiry_path
        fill_in 'inquiry[name]', with: ''
        click_button '確認画面へ'
        expect(page).to have_content 'を入力してください'
      end
      it "お問い合わせ内容確認画面に遷移できる" do

      end
    end
  end
end

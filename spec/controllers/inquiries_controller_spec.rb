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
    end
  end
end

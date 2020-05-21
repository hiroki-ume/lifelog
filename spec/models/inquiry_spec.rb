require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  describe 'お問い合わせ機能 nameのテスト' do
    context 'nameがnilの時' do
      before do
        @inquiry = Inquiry.create(name: "", email: "a@a", content: "hogehoge")
      end
      it "保存されない" do
        expect(@inquiry).to be_invalid
      end
      it "エラーメッセージが表示される" do
        @inquiry.valid?
        expect(@inquiry.errors[:name]).to include("can't be blank")
      end
    end
    context 'nameが１５文字以上の時' do
      before do
        @inquiry = Inquiry.create(name: "hogehogehogehoge")
      end
      it "保存されない" do
        expect(@inquiry).to be_invalid
      end
      it "エラーメッセージが表示される" do
        @inquiry.valid?
        expect(@inquiry.errors[:name]).to include("15")
      end
    end
  end
  describe 'emailのテスト' do
    context 'emailがnilのとき' do
      before do
        @inquiry = Inquiry.create(email: "")
      end
      it "保存されない" do
        expect(@inquiry).to be_invalid
      end
      it "エラーメッセージが表示される" do

      end
    end
    context 'emailが５０文字以上の時' do
      before do
        @inquiry = Inquiry.create(email: "#{"hogehoge" * 10}")
      end
      it "保存されない" do
        expect(@inquiry).to be_invalid
      end
      it "エラーメッセージが表示される" do

      end
    end
  end
end

require 'rails_helper'
describe 'お問い合わせ機能' do
  
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
        expect(@inquiry.errors[:name]).to include("を入力してください")
      end
    end
    context 'nameが20文字以上の時' do
      before do
        @inquiry = Inquiry.create(name: "hogehogehogehogehogehgoe")
      end
      it "保存されない" do
        expect(@inquiry).to be_invalid
      end
      it "エラーメッセージが表示される" do
        @inquiry.valid?
        expect(@inquiry.errors[:name]).to include("は20文字以内で入力してください")
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
        expect(@inquiry.errors[:email]).to include("を入力してください")
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
        expect(@inquiry.errors[:email]).to include("は50文字以内で入力してください")
      end
    end
  end

  describe 'contentのテスト'do
    context 'contentがnilのとき' do
      before do
        @inquiry = Inquiry.create(content: "")
      end
      it "保存されない" do
          expect(@inquiry).to be_invalid
      end
      it "エラ〜メッセージが表示される" do
        expect(@inquiry.errors[:content]).to include("を入力してください")
      end
    end
    context 'contentが２００文字以上の時' do
      before do
        @inquiry = Inquiry.create(content: "#{"hoge" * 60}")
      end
      it "保存されない" do
        expect(@inquiry).to be_invalid
      end
      it "エラ〜メッセージが表示される" do
        expect(@inquiry.errors[:content]).to include("は200文字以内で入力してください")
      end
    end
  end
end

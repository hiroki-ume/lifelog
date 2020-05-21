require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前とメールとパスワードで登録できる" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "名前がないと登録できない" do
    expect(FactoryBot.build(:user, name: "")).to be_invalid
  end

  it "メールアドレスがないと登録できない" do
    expect(FactoryBot.build(:user, email: "")).to be_invalid
  end

  it "メールアドレスが重複していると登録できない" do
    user1 = FactoryBot.create(:user, name: "taro", email: "taro@example.com")
    expect(FactoryBot.build(:user, name: "ziro", email: user1.email)).to be_invalid
  end

  it "パスワードがないと登録できない" do
    expect(FactoryBot.build(:user, password: "")).to be_invalid
  end

  it "パスワードが暗号化されているか" do
    user = FactoryBot.create(:user)
    expect(user.encrypted_password).to_not eq "password"
  end

  it "パスワードと確認用パスワードが異なっていたら登録できない" do
    expect(FactoryBot.build(:user, password: "password", password_confirmation: "passward")).to be_invalid
  end
end

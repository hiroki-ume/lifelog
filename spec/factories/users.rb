FactoryBot.define do
  factory :user do
    name {"hiroki"}
    sequence(:email) {|n| "hiroki#{n}@example.com"}
    password {"password"}
  end
end

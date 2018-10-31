FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    sequence(:username) { |n| "test#{n}" }
    sequence(:cname) { |n| "测试#{n}" }
    password 'password'
    trait :admin do
      is_admin true
    end
  end
end

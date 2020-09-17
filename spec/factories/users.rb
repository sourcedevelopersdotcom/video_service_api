FactoryBot.define do
  factory :user do
    email { 'foo@bar.com' }
  end

  factory :user_new, class: User do
    sequence(:email) { |n| "email-#{n}@example.com" }
  end
end

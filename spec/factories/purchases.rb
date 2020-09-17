FactoryBot.define do
  factory :purchase do
    option { |a| a.association(:option) }
    user { |a| a.association(:user) }
  end

  factory :purchase_list, class: Purchase do
    association :user, factory: :user_new
    association :option, factory: :option_new

    factory :purchase_recent do
      created_at { Time.now }
    end
    factory :purchase_old do
      created_at { Time.now - 4.days }
    end
  end
end

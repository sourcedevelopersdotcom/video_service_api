FactoryBot.define do
  factory :option do
    price { 1.5 }
    quality { 1 }
    content { |a| a.association(:content) }
  end

  factory :option_new, class: Option do
    for_hd
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    association :content
    trait :for_hd do
      quality { 'HD' }
    end

    trait :for_sd do
      quality { 'SD' }
    end
  end
end

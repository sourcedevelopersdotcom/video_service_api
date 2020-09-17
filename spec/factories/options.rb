FactoryBot.define do
  factory :option do
    price { 1.5 }
    quality { 1 }
    content { |a| a.association(:content) }
  end

  factory :option_new, class: Option do
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    quality { 1 }
    association :content
  end
end

FactoryBot.define do
  factory :option do
    price { 1.5 }
    quality { 1 }
    content { |a| a.association(:content) }
  end
end

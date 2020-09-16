FactoryBot.define do
  factory :content do
    contentable { |a| a.association(:movie) }
  end
end

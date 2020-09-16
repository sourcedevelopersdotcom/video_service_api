FactoryBot.define do
  factory :episode do
    title { 'Winter is Coming' }
    plot { 'Eddard Stark is torn between his family and an old friend when asked to serve at the side of King Robert Baratheon; Viserys plans to wed his sister to a nomadic warlord in exchange for an army.' }
    number { 1 }
    season { nil }
  end
end

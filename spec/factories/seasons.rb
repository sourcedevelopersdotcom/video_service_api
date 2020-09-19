FactoryBot.define do
  factory :season do
    title { 'Game of Thrones' }
    plot { "Don't want to be the king" }
    number { 1 }
  end

  factory :season2, class: Season do
    title { 'Game of Thrones' }
    plot { 'Birth of dragons' }
    number { 2 }
  end

  factory :season_new, class: Season do
    title { Faker::Movie.unique.title }
    plot { Faker::Movie.quote }
    number { Faker::Number.unique.decimal(l_digits: 2) }
  end
end

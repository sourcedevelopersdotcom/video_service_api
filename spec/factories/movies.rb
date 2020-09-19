FactoryBot.define do
  factory :movie do
    title { 'Matrix' }
    plot { 'Do not try and bend the spoon, that’s impossible. Instead, only try to realize the truth… there is no spoon. Then you’ll see that it is not the spoon that bends, it is only yourself.' }
  end

  factory :movie_new, class: Movie do
    title { Faker::Movie.unique.title }
    plot { Faker::Movie.quote }
  end
end

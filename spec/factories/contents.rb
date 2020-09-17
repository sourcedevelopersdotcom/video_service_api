FactoryBot.define do
  factory :content do
    for_movie

    trait :for_movie do
      association(:contentable, factory: :movie_new)
    end

    trait :for_season do
      association(:contentable, factory: :season_new)
    end
  end
end

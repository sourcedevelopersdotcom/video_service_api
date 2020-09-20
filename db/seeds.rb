## SEEDS FOR DEVELOPMENT
# movies = Movie.create([{ title: 'Star Wars', plot: 'May the force be with you' }, { title: 'Lord of the Rings', plot: 'I am a servant of the Secret Fire, wielder of the flame of Anor. You cannot pass. The dark fire will not avail you, flame of Udûn' }])
# seasons = Season.create([{ title: 'Game of Thrones', plot: 'Don\'t want to be the king', number: 1 }, { title: 'Game of Thrones', plot: 'Birth of dragons', number: 2 }])
# contents = Content.create([{ contentable_id: 1, contentable_type: Movie }, { contentable_id: 2, contentable_type: Movie }, { contentable_id: 1, contentable_type: Season }, { contentable_id: 2, contentable_type: Season }])
# options = Option.create([{ price: 2.99, quality: :SD, content_id: 1 }, { price: 5.99, quality: :HD, content_id: 1 }, { price: 1.99, quality: :SD, content_id: 2 }, { price: 6.99, quality: :HD, content_id: 2 }, { price: 2.99, quality: :SD, content_id: 3 }, { price: 5.99, quality: :HD, content_id: 3 },
#                          { price: 3.99, quality: :SD, content_id: 4 }, { price: 7.99, quality: :HD, content_id: 4 }])
# episodes = Episode.create([{ title: 'GoT S1E1', plot: 'First', number: 1, season_id: 1 }, { title: 'GoT S1E2', plot: 'Second', number: 2, season_id: 1 }, { title: 'GoT S2E1', plot: 'Second First', number: 1, season_id: 2 }, { title: 'GoT S2E2', plot: 'Second Second', number: 2, season_id: 2 }])
# users = User.create([{ email: 'foo@user.com' }, { email: 'bar@user.com' }])
# purchases = Purchase.create([{option_id: 1, user_id: 1}, {option_id: 6, user_id: 2}, {option_id: 3, user_id: 1}])

max = 12.99
min = 2.99

10.times { User.create(email: Faker::Internet.unique.email) }

(1..20).to_a.each do |_index|
  movie = Movie.create(title: "Movie #{_index}", plot: Faker::Movie.quote)
  content_movie = Content.create(contentable_id: movie.id, contentable_type: Movie)
  option_hd = Option.create(price: format('%.2f', (rand * (max - min) + min)), quality: 'HD', content_id: content_movie.id)
  option_sd = Option.create(price: format('%.2f', (rand * (max - min) + min)), quality: 'SD', content_id: content_movie.id)
  season = Season.create(title: "Season #{_index}", plot: Faker::Movie.quote, number: _index)
  (1..5).to_a.each do |_episode_index|
    Episode.create(title: Faker::Book.unique.title, plot: Faker::Movie.quote, number: _episode_index, season_id: season.id)
  end
  content_season = Content.create(contentable_id: season.id, contentable_type: Season)
  option_hd = Option.create(price: format('%.2f', (rand * (max - min) + min)), quality: 'HD', content_id: content_season.id)
  option_sd = Option.create(price: format('%.2f', (rand * (max - min) + min)), quality: 'SD', content_id: content_season.id)
end

(1..15).to_a.each do |_index|
  pursase = Purchase.create(user_id: Faker::Number.between(from: 1, to: 3), option_id: Faker::Number.between(from: 1, to: 80))
end

(1..5).to_a.each do |_index|
  pursase = Purchase.create(user_id: Faker::Number.between(from: 1, to: 3), option_id: Faker::Number.between(from: 1, to: 80), created_at: Time.now - 4.days)
end

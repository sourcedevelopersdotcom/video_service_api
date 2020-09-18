movies = Movie.create([{ title: 'Star Wars', plot: 'May the force be with you' }, { title: 'Lord of the Rings', plot: 'I am a servant of the Secret Fire, wielder of the flame of Anor. You cannot pass. The dark fire will not avail you, flame of Udûn' }])
seasons = Season.create([{ title: 'Game of Thrones', plot: 'Don\'t want to be the king', number: 1 }, { title: 'Game of Thrones', plot: 'Birth of dragons', number: 2 }])
contents = Content.create([{ contentable_id: 1, contentable_type: Movie }, { contentable_id: 2, contentable_type: Movie }, { contentable_id: 1, contentable_type: Season }, { contentable_id: 2, contentable_type: Season }])
options = Option.create([{ price: 2.99, quality: :SD, content_id: 1 }, { price: 5.99, quality: :HD, content_id: 1 }, { price: 1.99, quality: :SD, content_id: 2 }, { price: 6.99, quality: :HD, content_id: 2 }, { price: 2.99, quality: :SD, content_id: 3 }, { price: 5.99, quality: :HD, content_id: 3 },
                         { price: 3.99, quality: :SD, content_id: 4 }, { price: 7.99, quality: :HD, content_id: 4 }])
episodes = Episode.create([{ title: 'GoT S1E1', plot: 'First', number: 1, season_id: 1 }, { title: 'GoT S1E2', plot: 'Second', number: 2, season_id: 1 }, { title: 'GoT S2E1', plot: 'Second First', number: 1, season_id: 2 }, { title: 'GoT S2E2', plot: 'Second Second', number: 2, season_id: 2}])
users = User.create([{email: 'foo@user.com'}, {email: 'bar@user.com'}])
purchases = Purchase.create([{option_id: 1, user_id: 1}, {option_id: 6, user_id: 2}, {option_id: 3, user_id: 1}])

# (1..100).to_a.each do |_index|
#   post = Movie.create(title: Faker::Movie.title, plot: Faker::Movie.quote)
#   (1..1000).to_a.each do |comment_index|
#     post.comments.create(content: "Comment #{comment_index}")
# end

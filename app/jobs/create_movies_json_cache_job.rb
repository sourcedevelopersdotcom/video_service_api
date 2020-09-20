class CreateMoviesJsonCacheJob < ApplicationJob
  queue_as :default

  def perform(_movie = nil)
    movies = Movie.all

    Rails.cache.delete(_movie) unless _movie.nil?
    Rails.cache.delete(Movie.cache_key(movies))
    options = { include: %i[content options] }
    Rails.cache.fetch(Movie.cache_key(movies)) do
      Api::V1::MovieSerializer.new(movies, options).serializable_hash.to_json
    end
  end
end

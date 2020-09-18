class CreateMoviesJsonCacheJob < ApplicationJob
  queue_as :default

  def perform(_movie = nil)
    movies = Movie.all

    Rails.cache.delete(_movie) unless _movie.nil?
    Rails.cache.delete(Movie.cache_key(movies))
    Rails.cache.fetch(Movie.cache_key(movies)) do
      MovieSerializer.new(movies).serializable_hash.to_json
    end
  end
end

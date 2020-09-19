class MoviesController < ApplicationController
  # GET /movies
  def index
    @movies = Movie.all

    options = { include: %i[content options] }

    json = Rails.cache.fetch(Movie.cache_key(@movies)) do
      MovieSerializer.new(@movies, options).serializable_hash.to_json
    end

    render json: json
  end
end

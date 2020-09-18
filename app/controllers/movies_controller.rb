class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show update destroy]

  # GET /movies
  def index
    @movies = Movie.all

    json = Rails.cache.fetch(Movie.cache_key(@movies)) do
      MovieSerializer.new(@movies).serializable_hash.to_json
    end

    render json: json
  end
end

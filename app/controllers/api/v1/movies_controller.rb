module::Api
  module::V1
    class Api::V1::MoviesController < ApplicationController
      # GET /movies
      def index
        @movies = Movie.all

        options = { include: %i[content options] }

        json = Rails.cache.fetch(Movie.cache_key(@movies)) do
          Api::V1::MovieSerializer.new(@movies, options).serializable_hash.to_json
        end

        render json: json
      end
    end
  end
end

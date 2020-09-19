class SeasonsController < ApplicationController
  # GET /seasons
  def index
    @seasons = Season.all

    options = { include: %i[content options] }

    json = Rails.cache.fetch(Season.cache_key(@seasons)) do
      SeasonSerializer.new(@seasons, options).serializable_hash.to_json
    end

    render json: json
  end
end

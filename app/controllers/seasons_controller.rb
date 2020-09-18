class SeasonsController < ApplicationController
  before_action :set_season, only: %i[show update destroy]

  # GET /seasons
  def index
    @seasons = Season.all
    # options = { include: ['episodes'] }

    json = Rails.cache.fetch(Season.cache_key(@seasons)) do
      SeasonSerializer.new(@seasons).serializable_hash.to_json
    end

    render json: json
  end
end

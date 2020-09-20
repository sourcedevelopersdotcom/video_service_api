class CreateSeasonsJsonCacheJob < ApplicationJob
  queue_as :default

  def perform(_season = nil)
    seasons = Season.all

    Rails.cache.delete(_season) unless _season.nil?
    Rails.cache.delete(Season.cache_key(seasons))
    options = { include: %i[content options] }
    Rails.cache.fetch(Season.cache_key(seasons)) do
      Api::V1::SeasonSerializer.new(seasons, options).serializable_hash.to_json
    end
  end
end

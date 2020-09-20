class CreateEpisodesJsonCacheJob < ApplicationJob
  queue_as :default

  def perform(_episode = nil)
    episodes = Episode.all

    Rails.cache.delete(_episode) unless _episode.nil?
    Rails.cache.delete(Episode.cache_key(episodes))
    Rails.cache.fetch(Episode.cache_key(episodes)) do
      Api::V1::EpisodeSerializer.new(episodes).serializable_hash.to_json
    end
  end
end

class EpisodeSerializer
  include FastJsonapi::ObjectSerializer
  cache_options enabled: true, cache_length: 1.hour
  attributes :title, :plot, :number
  belongs_to :season
end

class SeasonSerializer
  include FastJsonapi::ObjectSerializer
  cache_options enabled: true, cache_length: 1.hour
  attributes :title, :plot, :number, :created_at, :updated_at

  attribute :episodes do |obj|
    EpisodeSerializer.new(obj.episodes)
  end
  # has_many :episodes
  # has_many :options
  # has_one :content
  # attribute :content { |obj| }
end

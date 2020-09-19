class MovieSerializer
  include FastJsonapi::ObjectSerializer
  cache_options enabled: true, cache_length: 1.hour
  attributes :title, :plot, :created_at, :updated_at

  has_one :content, serializer: ContentSerializer
  has_many :options, serializer: OptionSerializer
end

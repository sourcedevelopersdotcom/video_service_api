class MovieSerializer
  include FastJsonapi::ObjectSerializer
  cache_options enabled: true, cache_length: 1.hour
  attributes :title, :plot, :created_at, :updated_at
end

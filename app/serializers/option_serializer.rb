class OptionSerializer
  include FastJsonapi::ObjectSerializer
  cache_options enabled: true, cache_length: 1.hour
  attributes :price, :quality
  belongs_to :content
end

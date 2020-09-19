class OptionSerializer
  include FastJsonapi::ObjectSerializer
  cache_options enabled: true, cache_length: 1.hour
  attributes :price, :quality

  attributes :content do |obj|
    ContentSerializer.new(obj.content)
  end
end

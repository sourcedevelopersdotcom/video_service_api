class ContentSerializer
  include FastJsonapi::ObjectSerializer
  cache_options enabled: true, cache_length: 1.hour
  attributes :contentable_type
  attributes :contentable do |obj|
    if obj.contentable_type == 'Movie'
      MovieSerializer.new(obj.contentable)
    else
      SeasonSerializer.new(obj.contentable)
    end
  end

  has_many :options, serializer: OptionSerializer
end

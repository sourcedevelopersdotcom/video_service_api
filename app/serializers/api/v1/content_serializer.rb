module::Api
  module::V1
    class Api::V1::ContentSerializer
      include FastJsonapi::ObjectSerializer
      cache_options enabled: true, cache_length: 1.hour
      attributes :contentable_type
      attributes :contentable do |obj|
        obj.contentable_type == 'Movie' ? Api::V1::MovieSerializer.new(obj.contentable) : Api::V1::SeasonSerializer.new(obj.contentable)
      end

      has_many :options, serializer: Api::V1::OptionSerializer
    end
  end
end

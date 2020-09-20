module::Api
  module::V1
    class Api::V1::SeasonSerializer
      include FastJsonapi::ObjectSerializer
      cache_options enabled: true, cache_length: 1.hour
      attributes :title, :plot, :number

      attribute :episodes do |obj|
        Api::V1::EpisodeSerializer.new(obj.episodes)
      end

      attributes :created_at, :updated_at

      has_one :content, serializer: Api::V1::ContentSerializer
      has_many :options, serializer: Api::V1::OptionSerializer
    end
  end
end

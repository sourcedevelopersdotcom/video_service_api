module::Api
  module::V1
    class Api::V1::MovieSerializer
      include FastJsonapi::ObjectSerializer
      cache_options enabled: true, cache_length: 1.hour
      attributes :title, :plot, :created_at, :updated_at

      has_one :content, serializer: Api::V1::ContentSerializer
      has_many :options, serializer: Api::V1::OptionSerializer
    end
  end
end

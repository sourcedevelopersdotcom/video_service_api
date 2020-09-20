module::Api
  module::V1
    class Api::V1::OptionSerializer
      include FastJsonapi::ObjectSerializer
      cache_options enabled: true, cache_length: 1.hour
      attributes :price, :quality

      attributes :content do |obj|
        Api::V1::ContentSerializer.new(obj.content)
      end
    end
  end
end

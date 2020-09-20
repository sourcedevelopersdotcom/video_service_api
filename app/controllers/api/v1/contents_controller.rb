module::Api
  module::V1
    class Api::V1::ContentsController < ApplicationController
      # GET /contents
      def index
        @contents = Content.all_order_by_creation

        options = { include: [:options] }

        json = Rails.cache.fetch(Content.cache_key(@contents)) do
          Api::V1::ContentSerializer.new(@contents, options).serializable_hash.to_json
        end

        render json: json
      end
    end
  end
end

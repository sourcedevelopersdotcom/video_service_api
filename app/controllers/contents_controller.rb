class ContentsController < ApplicationController
  # GET /contents
  def index
    @contents = Content.all_order_by_creation

    json = Rails.cache.fetch(Content.cache_key(@contents)) do
      ContentSerializer.new(@contents).serializable_hash.to_json
    end

    render json: json
  end
end

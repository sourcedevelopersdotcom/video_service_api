class CreateContentsJsonCacheJob < ApplicationJob
  queue_as :default

  def perform(_content = nil)
    contents = Content.all_order_by_creation

    Rails.cache.delete(_content) unless _content.nil?
    Rails.cache.delete(Content.cache_key(contents))
    Rails.cache.fetch(Content.cache_key(contents)) do
      ContentSerializer.new(contents).serializable_hash.to_json
    end
  end
end

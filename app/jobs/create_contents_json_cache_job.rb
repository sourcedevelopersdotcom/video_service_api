class CreateContentsJsonCacheJob < ApplicationJob
  queue_as :default

  def perform(_content = nil)
    contents = Content.all_order_by_creation

    Rails.cache.delete(_content) unless _content.nil?
    Rails.cache.delete(Content.cache_key(contents))
    options = { include: [:options] }
    Rails.cache.fetch(Content.cache_key(contents)) do
      Api::V1::ContentSerializer.new(contents, options).serializable_hash.to_json
    end
    Rails.cache.delete_matched('serializer=users*')
    User.all.each { |user| CreatePurchasesJsonCacheJob.perform_later(user) }
  end
end

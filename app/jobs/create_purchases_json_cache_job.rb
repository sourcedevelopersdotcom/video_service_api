class CreatePurchasesJsonCacheJob < ApplicationJob
  queue_as :default

  def perform(_user)
    purchases = Library.where_user(_user)
    user = User.find(_user.id)

    Rails.cache.delete(Purchase.cache_key(user))
    Rails.cache.fetch(Purchase.cache_key(user)) do
      PurchaseSerializer.new(purchases).serializable_hash.to_json
    end
  end
end

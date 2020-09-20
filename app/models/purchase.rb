class Purchase < ApplicationRecord
  belongs_to :option
  belongs_to :user

  scope :where_user, ->(user) { where user_id: user }

  validate lambda {
             if Library.where_user(user).where_option(option).present?
               errors.add(:purchase, 'Content already in Library')
             end
           }

  after_commit :create_json_cache

  def self.cache_key(_user)
    {
      serializer: _user.cache_key,
      stat_record: Purchase.where_user(_user.id).maximum(:updated_at)
    }
  end

  private

  def create_json_cache
    CreatePurchasesJsonCacheJob.perform_later(user)
  end
end

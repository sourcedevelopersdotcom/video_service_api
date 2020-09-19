class Library < ApplicationRecord
  self.primary_key = 'id'
  belongs_to :option
  belongs_to :user

  scope :where_user, ->(user) { where user_id: user }
  scope :where_option, ->(option) { where option_id: option }
  scope :order_by_remaining_time, -> { order(created_at: :asc) }

  def readonly?
    true
  end
end

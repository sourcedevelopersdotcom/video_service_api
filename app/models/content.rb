class Content < ApplicationRecord
  belongs_to :contentable, polymorphic: true, touch: true
  has_many :options, dependent: :destroy

  validates_uniqueness_of :contentable_id, scope: :contentable_type

  scope :all_order_by_creation, lambda {
    select('contents.*, COALESCE(movies.created_at, seasons.created_at) AS content_created_at')
      .joins("LEFT OUTER JOIN movies ON movies.id = contents.contentable_id AND contents.contentable_type = 'Movie'")
      .joins("LEFT OUTER JOIN seasons ON seasons.id = contents.contentable_id AND contents.contentable_type = 'Season'")
      .order('content_created_at ASC')
  }

  scope :of_type, ->(type) { where contentable_type: type }

  after_commit :create_json_cache

  def self.cache_key(_contents)
    {
      serializer: 'contents',
      stat_record: Content.maximum(:updated_at)
    }
  end

  private

  def create_json_cache
    CreateContentsJsonCacheJob.perform_later(self)
  end
end

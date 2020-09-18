class Season < ApplicationRecord
  has_one :content, as: :contentable, dependent: :destroy
  has_many :options, through: :content
  has_many :episodes, -> { order(number: :asc) }, dependent: :destroy
  include TitlePlotPresenceValidations

  validates_presence_of :number
  validates_uniqueness_of :title, scope: :number, case_sensitive: false

  default_scope { order(created_at: :asc) }

  after_commit :create_json_cache

  def self.cache_key(_seasons)
    {
      serializer: 'seasons',
      stat_record: Season.maximum(:updated_at)
    }
  end

  private

  def create_json_cache
    CreateSeasonsJsonCacheJob.perform_later(self)
  end
end

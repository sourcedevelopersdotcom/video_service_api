class Episode < ApplicationRecord
  belongs_to :season, touch: true
  include TitlePlotPresenceValidations

  validates_presence_of :number, :season
  validates_uniqueness_of :number, scope: :season_id
  validates_uniqueness_of :title, scope: :season_id, case_sensitive: false

  after_commit :create_json_cache

  def self.cache_key(_episodes)
    {
      serializer: 'episodes',
      stat_record: Episode.maximum(:updated_at)
    }
  end

  private

  def create_json_cache
    CreateEpisodesJsonCacheJob.perform_later(self)
  end
end

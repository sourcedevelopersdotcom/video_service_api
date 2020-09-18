class Movie < ApplicationRecord
  has_one :content, as: :contentable, dependent: :destroy
  has_many :options, through: :content
  include TitlePlotPresenceValidations

  validates_uniqueness_of :title, case_sensitive: false

  default_scope { order(created_at: :asc) }

  after_commit :create_json_cache

  def self.cache_key(_movies)
    {
      serializer: 'movies',
      stat_record: Movie.maximum(:updated_at)
    }
  end

  private

  def create_json_cache
    CreateMoviesJsonCacheJob.perform_later(self)
  end
end

class Option < ApplicationRecord
  belongs_to :content
  has_one :movie, through: :content, source: :contentable, source_type: 'Movie'
  has_one :season, through: :content, source: :contentable, source_type: 'Season'
  enum quality: %i[SD HD]
  has_many :purchases, dependent: :destroy
  validates_presence_of :price, :quality
  validates_uniqueness_of :price, scope: %i[quality content_id]
end

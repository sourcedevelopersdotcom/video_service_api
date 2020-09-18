class Episode < ApplicationRecord
  belongs_to :season, touch: true
  include TitlePlotPresenceValidations

  validates_presence_of :number, :season
  validates_uniqueness_of :number, scope: :season_id
  validates_uniqueness_of :title, scope: :season_id, case_sensitive: false
end

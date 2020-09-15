class Movie < ApplicationRecord
  has_many :contents, as: :contentable
  include TitlePlotPresenceValidations

  validates_uniqueness_of :title, case_sensitive: false
end

class Movie < ApplicationRecord
  has_one :content, as: :contentable, dependent: :destroy
  has_many :options, through: :content
  include TitlePlotPresenceValidations

  validates_uniqueness_of :title, case_sensitive: false

  default_scope { order(created_at: :desc) }
end

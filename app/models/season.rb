class Season < ApplicationRecord
  has_many :contents, as: :contentable
  has_many :episodes, -> { order(number: :asc) }, dependent: :destroy
  include TitlePlotPresenceValidations

  validates_presence_of :number
  validates_uniqueness_of :title, scope: :number, case_sensitive: false
end

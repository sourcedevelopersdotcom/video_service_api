class Season < ApplicationRecord
  has_many :contents, as: :contentable
  has_many :episodes
  include TitlePlotValidations

  validates_presence_of :number
end

class Episode < ApplicationRecord
  belongs_to :season
  include TitlePlotValidations
  validates_presence_of :number
end

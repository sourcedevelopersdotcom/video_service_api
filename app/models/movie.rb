class Movie < ApplicationRecord
  has_many :contents, as: :contentable
  include TitlePlotValidations
end

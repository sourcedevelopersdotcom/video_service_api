module TitlePlotValidations
  extend ActiveSupport::Concern

  included do
    validates_presence_of :title, :plot
  end
end

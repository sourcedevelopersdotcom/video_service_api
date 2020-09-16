class Season < ApplicationRecord
  has_one :content, as: :contentable, dependent: :destroy
  has_many :options, through: :content
  has_many :episodes, -> { order(number: :asc) }, dependent: :destroy
  include TitlePlotPresenceValidations

  validates_presence_of :number
  validates_uniqueness_of :title, scope: :number, case_sensitive: false

  default_scope { order(created_at: :desc) }
end

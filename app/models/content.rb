class Content < ApplicationRecord
  belongs_to :contentable, polymorphic: true
  has_many :options, dependent: :destroy

  validates_uniqueness_of :contentable_id, scope: :contentable_type
end

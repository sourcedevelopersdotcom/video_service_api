class User < ApplicationRecord
  has_many :purchases, dependent: :destroy

  validates_uniqueness_of :email, case_sensitive: false
end

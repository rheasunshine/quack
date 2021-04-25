class ExternalApi < ApplicationRecord
  validates_presence_of %i[name description partner]

  belongs_to :partner
  has_many :endpoints
end

class Endpoint < ApplicationRecord
  validates_presence_of %i[name description endpoint external_api]

  has_many :mocks
  belongs_to :external_api

  scope :dynamic, -> { where.not(regex: nil) }
end

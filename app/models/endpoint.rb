class Endpoint < ApplicationRecord
  validates_presence_of %i[name description endpoint]

  has_many :mocks
end

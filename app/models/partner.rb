class Partner < ApplicationRecord
  validates_presence_of %i[name description identifier]

  has_many :external_apis
end

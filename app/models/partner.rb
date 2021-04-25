class Partner < ApplicationRecord
  validates_presence_of %i[name description identifier]
end

class Header < ApplicationRecord
  validates_presence_of %i[name value mock]

  belongs_to :mock
end

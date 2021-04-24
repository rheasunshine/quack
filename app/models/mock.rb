class Mock < ApplicationRecord
  acts_as_list

  # validates_presence_of %i[name description request_method
  #                          content_type body_type body_content
  #                          endpoint] # position active

  belongs_to :endpoint
  has_many   :headers

  accepts_nested_attributes_for :headers, allow_destroy: true, reject_if: :all_blank
end

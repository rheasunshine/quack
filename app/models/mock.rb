class Mock < ApplicationRecord
  acts_as_list
  validates_presence_of %i[name description request_method
                           content_type body_type body_content
                           endpoint status]

  belongs_to :endpoint
  has_many   :headers

  accepts_nested_attributes_for :headers, allow_destroy: true, reject_if: :all_blank

  before_save :eval_body_content

  def eval_body_content
    if body_type == "json" && self.body_content.is_a?(String)
      # i know this is rly bad for security but this is a mock app and can wait
      self.body_content = eval(self.body_content)
    end
  end
end

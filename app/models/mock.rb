class Mock < ApplicationRecord
  acts_as_list
  validates_presence_of %i[name description request_method
                           content_type body_type body_content
                           endpoint status]

  belongs_to :endpoint
  has_many   :headers

  accepts_nested_attributes_for :headers, allow_destroy: true, reject_if: :all_blank

  before_save :mark_active
  before_save :eval_body_content

  def eval_body_content
    if body_type == "json" && self.body_content.is_a?(String)
      # i know this is rly bad for security but this is a mock app and can wait
      self.body_content = eval(self.body_content)
    end
  end

  # def check_active
  #   active_mock.active = true unless active_mock.active
  #   Mock.all.except(active_mock).each { |mock| mock.active = false }
  # end
  #
  # def active_mock
  #   self.endpoint.mocks.order(:position)&.first
  # end
end

class Api::RequestsController < ApplicationController
  def serve_mock_response
    render build_mock_response
  rescue => e
    head :bad_request
  end

  private
  delegate :method, :fullpath, :raw_post, to: :request
  delegate :headers, :body_content, :body_type, :content_type, :status, :request_method, to: :mock

  def build_mock_response
    {
      headers: response_headers,
      body: body_content.to_json,
      content_type: content_type,
      status: status,
    }
  end

  def mock
    @mock ||= Mock.where(
      endpoint: endpoint,
      request_method: method,
    ).order(:position).first
  end

  def endpoint
    Endpoint.find_by(endpoint: fullpath)
  end

  def response_headers
    headers.each_with_object({}) do |header, headers|
      headers[header.name] = header.value
    end
  end
end

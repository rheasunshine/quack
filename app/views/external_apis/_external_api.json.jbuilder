json.extract! external_api, :id, :name, :description, :partner_id, :created_at, :updated_at
json.url external_api_url(external_api, format: :json)

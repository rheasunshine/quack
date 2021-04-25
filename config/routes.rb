Rails.application.routes.draw do
  resources :external_apis
  resources :partners
  # ***** #
  resources :endpoints
  resources :headers
  resources :mocks do
    patch :move
  end

  match "*path", to: "api/requests#serve_mock_response", via: :all
end

Rails.application.routes.draw do
  root "partners#index"
  resources :partners
  resources :external_apis
  # ***** #
  resources :endpoints
  resources :headers
  resources :mocks do
    patch :move
  end

  match "*path", to: "api/requests#serve_mock_response", via: :all
end

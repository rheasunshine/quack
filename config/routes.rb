Rails.application.routes.draw do
  resources :headers
  resources :mocks do
    patch :move
  end

  resources :endpoints
end

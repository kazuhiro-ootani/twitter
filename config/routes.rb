Rails.application.routes.draw do
  root 'tweets#index'
  resources :messages, only: [:index, :create]
end

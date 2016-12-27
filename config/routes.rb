Rails.application.routes.draw do
  root 'tweets#index'
  devise_for :users
  resources :tweets, only: [:index, :new, :show, :edit, :create]
end

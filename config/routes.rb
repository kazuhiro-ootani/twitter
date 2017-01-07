Rails.application.routes.draw do
  root 'tweets#index'
  devise_for :users
  resources :followed, only:[:show]
  resources :following, only:[:show]
  resources :tweets, only: [:index, :new, :show, :edit, :create]
  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :user, only:[:show]
  resources :relationships, only: [:create, :destroy]
  resources :search, only:[:index] do
    collection do
      get :tweet
    end
  end
  resources :favorites, only: [:show,:create, :destroy]
end

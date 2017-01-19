Rails.application.routes.draw do
  root 'tweets#index'
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :tweets, only: [:index, :new, :show, :edit, :create, :update]
  resources :users, only:[:show]
  resources :favorites, only: [:show,:create, :destroy]
  resources :followed, only:[:show]
  resources :following, only:[:show]
  resources :relationships, only: [:create, :destroy]
  resources :recommend, only:[:index]
  resources :search, only:[:index] do
    collection do
      get :tweet
    end
  end
end

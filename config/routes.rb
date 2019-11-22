Rails.application.routes.draw do

  # Session Routes
  get     'login',  to: 'sessions#new'
  post    'login',  to: 'sessions#create'
  delete  'logout', to: 'sessions#destroy'

  # User Routes
  resources :users

  # Post routes
  post 'publish', to: 'posts#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'users#index'
end

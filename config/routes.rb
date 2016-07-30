Rails.application.routes.draw do
  root to: "home#show"

  get 'auth/google_oauth2/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get '/dashboard', to: 'users#show'

  resources :styles, only: [:index, :show]
  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  resources :beers, only: [:show]
  resources :breweries, only: [:index, :show]
end

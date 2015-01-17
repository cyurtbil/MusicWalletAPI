Rails.application.routes.draw do

  resources :users, only: [:index, :create]
  resources :wallets, only: [:index, :show]
  resources :songs

  post 'cloud/get_tracks'

  post '/login', to: 'users#login'
  get '/logout', to: 'users#logout'
end

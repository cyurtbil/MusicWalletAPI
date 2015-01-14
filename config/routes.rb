Rails.application.routes.draw do

  resources :users, only: [:index]
  resources :wallets, only: [:index, :show]
  resources :songs

  get 'cloud/get_redirect_uri'
  post 'users/get_current_user'
  match '/auth/:provider/callback', to: 'users#login', via: [:get, :post]
  post '/logout', to: 'users#logout'

  post 'cloud/get_tracks'
end

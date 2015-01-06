Rails.application.routes.draw do

  resources :users, only: [:index]

  get 'cloud/get_redirect_uri'
  match '/auth/:provider/callback', to: 'users#login', via: [:get, :post]
  get '/logout', to: 'users#logout'
end

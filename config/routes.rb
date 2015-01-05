Rails.application.routes.draw do

  resources :users, only: [:index]

  get 'cloud/get_redirect_uri'
  match '/auth/:provider/callback', :to => 'users#authenticate_user', via: [:get, :post]
end

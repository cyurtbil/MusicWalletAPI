Rails.application.routes.draw do

  resources :users, only: [:index]

  get 'cloud/get_redirect_uri'
  get 'users/get_current_user'
  match '/auth/:provider/callback', :to => 'users#login', via: [:get, :post]
end

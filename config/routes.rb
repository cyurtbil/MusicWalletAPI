Rails.application.routes.draw do

  resources :users

  get 'cloud/get_redirect_uri'
  get 'cloud/get_current_user'
  match '/auth/:provider/callback', :to => 'cloud#authenticate_user', via: [:get, :post]
end

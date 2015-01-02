Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :soundcloud, ENV['SC_CLIENT_ID'], ENV['SC_CLIENT_SECRET']
end
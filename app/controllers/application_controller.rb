class ApplicationController < ActionController::API
  include ActionController::ImplicitRender

  protected

    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        User.find_by(token: token)
      end
    end
end

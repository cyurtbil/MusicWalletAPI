class CloudController < ApplicationController

  def get_redirect_uri
    response = Cloud.create_client
    render json: response, status: 200
  end
end
class CloudController < ApplicationController

  def get_redirect_uri
    response = Cloud.create_client
    render json: response, status: 200
  end

  def authenticate_user
    client = Soundcloud.new(client_id: ENV["SC_CLIENT_ID"],
                            client_secret: ENV["SC_CLIENT_SECRET"],
                            redirect_uri: ENV["REDIRECT_URI"])

    code = params[:code]
    access_token = client.exchange_token(code: code)

    client = Soundcloud.new(access_token: access_token)

    client = Soundcloud.new(client_id: ENV["SC_CLIENT_ID"],
                            client_secret: ENV["SC_CLIENT_SECRET"],
                            refresh_token: client.options[:access_token]["refresh_token"])
    binding.pry
    @current_user = client.get('/me')
    redirect_to "http://localhost:9000/#/home"
  end
end
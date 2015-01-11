class CloudController < ApplicationController

  def get_redirect_uri
    response = Cloud.create_client
    render json: response, status: 200
  end

  def get_tracks
    urls = Cloud.get_tracks_from_cloud(params)
    render json: {urls: urls}, status: 200
  end
end
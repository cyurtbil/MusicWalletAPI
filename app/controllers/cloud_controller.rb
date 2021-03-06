class CloudController < ApplicationController

  def get_tracks
    tracks = Cloud.get_tracks_from_cloud(params)
    urls = Cloud.create_url_for_tracks(tracks)
    render json: {urls: urls}, status: 200
  end
end
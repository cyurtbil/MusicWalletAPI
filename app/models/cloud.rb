class Cloud

  def self.create_client
    client = Soundcloud.new(client_id: ENV["SC_CLIENT_ID"],
                            client_secret: ENV["SC_CLIENT_SECRET"],
                            redirect_uri: ENV["REDIRECT_URI"])
    return {url: client.authorize_url(scope: 'non-expiring')}
  end

  def self.get_tracks_from_cloud(params)
    client = Soundcloud.new(client_id: ENV["SC_CLIENT_ID"])
    tracks = client.get('/tracks', q: params[:input], limit: 10)
  end

  def self.create_url_for_tracks(tracks)
    urls = []
    tracks.each do |track|
      src = "https://w.soundcloud.com/player/?visual=true&url=https%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F#{track[:id]}&show_artwork=true&client_id=#{ENV["SC_CLIENT_ID"]}"
      urls << src
    end
    urls
  end
end
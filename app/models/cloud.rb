class Cloud

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
class Cloud

  def self.create_client
    client = Soundcloud.new(client_id: ENV["SC_CLIENT_ID"],
                            client_secret: ENV["SC_CLIENT_SECRET"],
                            redirect_uri: ENV["REDIRECT_URI"])
    return {url: client.authorize_url(scope: 'non-expiring')}
  end

  def self.authorize_with_cloud
  end
end
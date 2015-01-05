class User < ActiveRecord::Base
  has_many :wallets
  has_many :authentications

  def self.get_user_params(params)
      client = Soundcloud.new(client_id: ENV["SC_CLIENT_ID"],
                              client_secret: ENV["SC_CLIENT_SECRET"],
                              redirect_uri: ENV["REDIRECT_URI"])
      code = params[:code]
      access_token = client.exchange_token(code: code)

      client_with_token = Soundcloud.new(access_token: access_token)
      current_user = client.get('/me')
      
      return {params: params, access_token: access_token, current_user: current_user}
  end
end
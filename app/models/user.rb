class User < ActiveRecord::Base
  has_many :wallets
  has_one :authentication
  validates :username, uniqueness: true, on: :login

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

  def self.create_user(auth_params)
    user = self.new({username: auth_params[:current_user]["username"]})
    user.image_url = auth_params[:current_user]["avatar_url"]
    user.followers_count = auth_params[:current_user]["followers_count"]
    user.followings_count = auth_params[:current_user]["followings_count"]
    return user
  end

  def self.update_existing_user(existing_user, auth_params)
    existing_user.authentication.update(access_token: auth_params[:access_token]["access_token"])
  end
end
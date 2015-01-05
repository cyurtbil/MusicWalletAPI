class Authentication < ActiveRecord::Base
  belongs_to :user
  validates :uid, uniqueness: true

  def self.create_user_authentication(params, auth_params, user)
    authentication = self.new({user_id: user.id})
    authentication.provider = params[:provider]
    authentication.uid = auth_params[:current_user]["id"]
    authentication.access_token = auth_params[:access_token]["access_token"]
    authentication.scope = auth_params[:access_token]["scope"]
    return authentication
  end
end
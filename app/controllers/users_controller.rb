class UsersController < ApplicationController

  def index
    @users = User.all.includes([:wallets])
  end

  def login
    auth_params = User.get_user_params(params)
    existing_user = User.find_by_username(auth_params[:current_user]["username"])
    if !existing_user
      user = User.create_user(auth_params)
      if auth_params && user.save
        authentication = Authentication.create_user_authentication(params, auth_params, user)
        authentication.save
        Wallet.create_wallets(user)
        redirect_to "http://localhost:9000/#/home/#{user.username}"
      else
        head :unauthorized
      end
    else
      if auth_params && existing_user
        existing_user.update({token: SecureRandom.uuid.gsub(/\-/, '')})
        authentication = Authentication.create_user_authentication(params, auth_params, existing_user)
        authentication.save
        redirect_to "http://localhost:9000/#/home/#{existing_user.username}"
      else
        head :unauthorized
      end
    end
  end

  def get_current_user
    binding.pry
    username = Base64.decode64(params[:username])
    current_user = User.find_by({username: username})
    if current_user
      if current_user.authentication
        render json: {current_user: current_user}, status: 200
      else
        head :unauthorized
      end
    else
      head :unauthorized
    end
  end

  def logout
    current_user_auth = Authentication.find_by({user_id: params[:current_user][:id]})
    current_user_auth.destroy
    head :ok
  end
end
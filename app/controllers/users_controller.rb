class UsersController < ApplicationController

  def index
    @users = User.all
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
        redirect_to "http://localhost:9000/#/home" 
      else
        head :unauthorized
      end
    else
      if auth_params && existing_user.authentication
        User.update_existing_user(existing_user, auth_params)
        redirect_to "http://localhost:9000/#/home"
      else
        head :unauthorized
      end
    end
  end

  def get_current_user
    current_user = User.get_current_user
    render json: {current_user: current_user}, status: 200
  end

  def logout
    User.log_user_out
    head :ok
  end
end
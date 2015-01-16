class UsersController < ApplicationController

  def index
    @users = User.all.includes([:wallets])
  end

  def create_different
    user = User.new({token: SecureRandom.uuid.gsub(/\-/, '')})
    render json: user, status: 200
  end

  def store_user
    user = User.new({token: params[:info]["token"]})
    User.store_current_user(user)
    render json: {stored: true}, status: 200
  end

  def login
    auth_params = User.get_user_params(params)
    existing_user = User.find_by_username(auth_params[:current_user]["username"])
    if !existing_user
      user = User.create_user(auth_params, User.get_current_user)
      if auth_params && user.save
        Wallet.create_wallets(user)
        authentication = Authentication.create_user_authentication(params, auth_params, user)
        if authentication.save
          redirect_to "http://localhost:9000/#/home"
        else
          head :unauthorized
        end
      else
        head :unauthorized
      end
    else
      if auth_params && existing_user
        token = User.get_current_user.token
        existing_user.update({token: token})
        authentication = Authentication.create_user_authentication(params, auth_params, existing_user)
        authentication.save
        redirect_to "http://localhost:9000/#/home"
        # if authentication.save
        #   redirect_to "http://localhost:9000/#/home"
        # else
        #   head :unauthorized
        # end
      else
        head :unauthorized
      end
    end
  end

  def logout
    current_user_auth = Authentication.find_by({user_id: params[:current_user][:id]})
    current_user_auth.destroy
    head :ok
  end
end
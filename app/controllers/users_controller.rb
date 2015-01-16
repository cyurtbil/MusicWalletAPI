class UsersController < ApplicationController

  def index
    @users = User.all.includes([:wallets])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      Wallet.create_wallets(@user)
      render json: {token: @user.token}, status: :created
    else
      render json: @user.errors, status: :unprocessable_entitiy
    end
  end

  def login
    user = User.find_by({username: params[:username]})

    if user && user.authenticate(params[:password])
      render json: {token: token}, status: 200
    else
      head :unauthorized
    end
  end

  def logout
    head :ok
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
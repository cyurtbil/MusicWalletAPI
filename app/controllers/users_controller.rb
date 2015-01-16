class UsersController < ApplicationController

  def index
    @users = User.all.includes([:wallets])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entitiy
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
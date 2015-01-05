class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def authenticate_user
    auth_params = User.get_user_params(params)
    if auth_params
      redirect_to "http://localhost:9000/#/home"
    end
  end
end
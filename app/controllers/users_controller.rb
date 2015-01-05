class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def login
    auth_params = User.get_user_params(params)
    binding.pry
    @user = User.new({username: auth_params[:current_user]["username"]})
    @user.image_url = auth_params[:current_user]["avatar_url"]
    @user.followers_count = auth_params[:current_user]["followers_count"]
    @user.followings_count = auth_params[:current_user]["followings_count"]
    if auth_params && @user.save
      @authentication = Authentication.new
      redirect_to "http://localhost:9000/#/home"
    else
      render text: "Fails to login"
    end
  end
end
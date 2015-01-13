class WalletsController < ApplicationController
  def index
    @wallets = Wallet.all.includes([:songs])
  end

  def show
    @wallet = Wallet.find(params[:id])
  end
end
class WalletsController < ApplicationController
  def index
    @wallets = Wallet.all
  end
end
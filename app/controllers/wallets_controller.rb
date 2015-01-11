class WalletsController < ApplicationController
  def index
    @wallets = Wallet.all.includes([:songs])
  end
end
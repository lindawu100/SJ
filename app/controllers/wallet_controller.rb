class WalletController < ApplicationController
  def show
    @wallet = Wallet.find(params[:id])
    @deals = Deal.where('ownerid = ? OR receiverid = ?', @wallet.id, @wallet.id)
    @new_deal = Deal.new
  end
end
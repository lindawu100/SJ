class WalletController < ApplicationController
  def show
    @wallet = Wallet.find(params[:id])
    @transcation = Transcation.where('ownerid = ? OR receiverid = ?', @wallet.id, params[:id])
  end
end
class Api::V1::WalletController < ApplicationController

  def transaction
    owner_wallet = Wallet.find(params[:id])
    amount = params[:deal][:amount].to_i

    if owner_wallet.balance >= amount && amount > 0
      deal = Deal.new(ownerid: params[:id], receiverid: params[:deal][:receiverid], amount: amount)
    
      render json: deal, status: 200 if deal.save
    else
      render json: { message: "Fail to transaction" }, status: 400
    end

  end

end
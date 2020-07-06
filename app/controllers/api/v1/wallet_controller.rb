class Api::V1::WalletController < ApplicationController

  def transaction
    
    owner_wallet = Wallet.find(params[:id])
    receiver_wallet = Wallet.find(params[:deal][:receiverid])
    amount = params[:deal][:amount].to_i

    owner_wallet.update(balance: owner_wallet.balance -= amount)

    receiver_wallet.update(balance: receiver_wallet.balance += amount)

    Deal.create(ownerid: params[:id], receiverid: params[:deal][:receiverid], amount: params[:deal][:amount])

    redirect_to wallet_path(owner_wallet.id)
  end

end
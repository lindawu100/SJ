class Api::V1::WalletController < ApplicationController

  def transaction
    owner_wallet = Wallet.find(params[:id])

    amount = params[:deal][:amount].to_i

    deal = Deal.new(ownerid: params[:id], receiverid: params[:deal][:receiverid], amount: params[:deal][:amount])

    if deal.save
      render json: deal
      # redirect_to wallet_path(owner_wallet.id)
    else
      render json: { message: "Amount of transaction can not exceed balance." }, status: 400
      # redirect_to wallet_path(owner_wallet.id), alert: "Amount of transaction can not exceed balance."
    end

  end

end
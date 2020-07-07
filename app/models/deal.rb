class Deal < ApplicationRecord
  belongs_to :wallet, class_name: "Wallet", foreign_key: "ownerid"
  belongs_to :receiver, class_name: "Wallet", foreign_key: "receiverid"

  before_create :generate_transaction

  private
  def generate_transaction
    ActiveRecord::Base.transaction do
      byebug
      wallet.withdraw(amount)
      receiver.deposit(amount)
    end
  end
end

require 'rails_helper'

RSpec.describe Wallet, type: :model do
  let(:wallet) {Wallet.create(balance: 100)}

  describe "Basic function" do
    it "user can withdraw money for payment" do
      wallet.withdraw(100)
      expect(wallet.balance).to be 0
    end

    it "the amount of withdraw can't exceed balance" do
      wallet.withdraw(300)
      expect(wallet.balance).to be 100
    end

    it "user can't withdraw money below 0" do
      wallet.withdraw(-100)
      expect(wallet.balance).to be 100
    end

    it "user can deposit money" do
      wallet.deposit(100)
      expect(wallet.balance).to be 200
    end

    it "user can't deposit money below 0" do
      wallet.deposit(-100)
      expect(wallet.balance).to be 100
    end
  end

end

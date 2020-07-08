require 'rails_helper'

RSpec.describe Deal, type: :model do

  describe "situations for deal" do
    it "owner can pay to receiver" do
      owner = Wallet.create(balance: 1000)
      receiver = Wallet.create(balance: 2000)

      Deal.create(wallet: owner, receiver: receiver, amount: 100)

      expect(owner.balance).to be 900
      expect(receiver.balance).to be 2100
    end

    it "owner can't pay amount over balance" do
      owner = Wallet.create(balance: 1000)
      receiver = Wallet.create(balance: 2000)

      Deal.create(wallet: owner, receiver: receiver, amount: 2000)

      expect(owner.balance).to be 1000
      expect(receiver.balance).to be 2000
    end

    it "owner can't pay amount below 0" do
      owner = Wallet.create(balance: 1000)
      receiver = Wallet.create(balance: 2000)

      Deal.create(wallet: owner, receiver: receiver, amount: -1000)

      expect(owner.balance).to be 1000
      expect(receiver.balance).to be 2000
    end
  end

end

class Wallet < ApplicationRecord
  has_many :deal, foreign_key: 'ownerid'
  has_many :deal, foreign_key: 'receiverid'

  def withdraw(amount)
    if amount > 0 && amount <= self.balance
      self.update!(balance: self.balance - amount)
    end
  end

  def deposit(amount)
    if amount > 0
      self.update!(balance: self.balance + amount)
    end
  end

end

class Wallet < ApplicationRecord
  has_many :deal, foreign_key: 'ownerid'
  has_many :deal, foreign_key: 'receiverid'

  def withdraw(amount)
    self.update!(balance: self.balance - amount)
  end

  def deposit(amount)
    self.update!(balance: self.balance + amount)
  end

end

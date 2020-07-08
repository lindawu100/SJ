class Wallet < ApplicationRecord

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

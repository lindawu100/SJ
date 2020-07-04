class Wallet < ApplicationRecord
  has_many :transcation, foreign_key: 'ownerid'
  has_many :transcation, foreign_key: 'receiverid'
end

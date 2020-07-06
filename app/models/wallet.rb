class Wallet < ApplicationRecord
  has_many :deal, foreign_key: 'ownerid'
  has_many :deal, foreign_key: 'receiverid'
end

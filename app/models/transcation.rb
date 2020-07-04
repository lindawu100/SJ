class Transcation < ApplicationRecord
  belongs_to :wallet, foreign_key: "ownerid"
  belongs_to :receiver, class_name: 'Wallet', foreign_key: "receiverid"
end

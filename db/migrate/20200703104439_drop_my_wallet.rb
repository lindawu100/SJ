class DropMyWallet < ActiveRecord::Migration[6.0]
  def change
    drop_table :my_wallets
  end
end

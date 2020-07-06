class RenameAmountToBalance < ActiveRecord::Migration[6.0]
  def change
    rename_column :wallets, :amount, :balance
  end
end

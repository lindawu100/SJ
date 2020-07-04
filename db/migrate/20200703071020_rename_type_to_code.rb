class RenameTypeToCode < ActiveRecord::Migration[6.0]
  def change
    rename_column :transcations, :type, :code
  end
end

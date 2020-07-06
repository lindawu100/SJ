class RenameTranscationsToDeal < ActiveRecord::Migration[6.0]
  def change
    rename_table :transcations, :deals
  end
end

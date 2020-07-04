class CreateTranscations < ActiveRecord::Migration[6.0]
  def change
    create_table :transcations do |t|
      t.integer :ownerid
      t.integer :receiverid
      t.string :type
      t.integer :amount
      t.string :note

      t.timestamps
    end
  end
end

class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.float :amount
      t.integer :direction
      t.string :desc

      t.timestamps
    end
  end
end

class AddTransactionCreatorIdAndPayerId < ActiveRecord::Migration
  def change
    add_column :transactions, :creator_id, :integer
    add_column :transactions, :payer_id, :integer
  end
end

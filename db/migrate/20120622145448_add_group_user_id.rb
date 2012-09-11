class AddGroupUserId < ActiveRecord::Migration
  def change
    remove_column :users, :owned_group_id, :integer
    add_column :groups, :owner_id, :integer
  end
end

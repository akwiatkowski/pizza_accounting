class AddUserOwnedGroupId < ActiveRecord::Migration
  def change
    add_column :users, :owned_group_id, :integer
  end
end

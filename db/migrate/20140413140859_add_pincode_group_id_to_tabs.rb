class AddPincodeGroupIdToTabs < ActiveRecord::Migration[4.2]
  def change
    add_column :tabs, :pincode_group_id, :integer
  end
end

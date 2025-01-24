class AddGroupPincodeIdToPincodes < ActiveRecord::Migration[4.2]
  def change
    add_column :pincodes, :pincode_group_id, :integer
  end
end

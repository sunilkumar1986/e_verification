class CreatePincodeGroups < ActiveRecord::Migration[4.2]
  def change
    create_table :pincode_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end

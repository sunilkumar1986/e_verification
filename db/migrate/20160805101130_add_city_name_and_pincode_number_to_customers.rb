class AddCityNameAndPincodeNumberToCustomers < ActiveRecord::Migration[4.2]
  def change
    add_column :customers, :city_name, :string
    add_column :customers, :pincode_number, :string
  end
end

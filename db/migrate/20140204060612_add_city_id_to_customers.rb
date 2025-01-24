class AddCityIdToCustomers < ActiveRecord::Migration[4.2]
  def change
    add_column :customers, :city_id, :integer
  end
end

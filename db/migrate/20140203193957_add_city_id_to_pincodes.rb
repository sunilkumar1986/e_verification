class AddCityIdToPincodes < ActiveRecord::Migration[4.2]
  def change
    add_column :pincodes, :city_id, :integer
  end
end

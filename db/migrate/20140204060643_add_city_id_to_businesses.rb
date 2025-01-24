class AddCityIdToBusinesses < ActiveRecord::Migration[4.2]
  def change
    add_column :businesses, :city_id, :integer
  end
end

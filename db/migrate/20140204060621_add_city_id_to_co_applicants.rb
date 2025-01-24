class AddCityIdToCoApplicants < ActiveRecord::Migration[4.2]
  def change
    add_column :co_applicants, :city_id, :integer
  end
end

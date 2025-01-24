class AddCityIdToCoApplicantBusinesses < ActiveRecord::Migration[4.2]
  def change
    add_column :co_applicant_businesses, :city_id, :integer
  end
end

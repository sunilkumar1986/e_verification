class AddNoVerifationToCustomers < ActiveRecord::Migration[4.2]
  def change
    add_column :customers, :no_verifcation, :boolean
  end
end

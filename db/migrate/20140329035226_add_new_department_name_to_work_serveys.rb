class AddNewDepartmentNameToWorkServeys < ActiveRecord::Migration[4.2]
  def change
    add_column :work_serveys, :new_department_name, :string
  end
end

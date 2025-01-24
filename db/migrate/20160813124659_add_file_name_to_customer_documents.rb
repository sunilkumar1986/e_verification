class AddFileNameToCustomerDocuments < ActiveRecord::Migration[4.2]
  def change
    add_column :customer_documents, :file_name, :string
  end
end

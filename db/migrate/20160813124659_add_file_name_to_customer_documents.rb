class AddFileNameToCustomerDocuments < ActiveRecord::Migration
  def change
    add_column :customer_documents, :file_name, :string
  end
end

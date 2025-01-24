class CreateDocuments < ActiveRecord::Migration[4.2]
  def change
    create_table :documents do |t|
      t.integer :customer_id

      t.timestamps
    end
  end
end

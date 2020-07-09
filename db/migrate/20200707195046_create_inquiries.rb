class CreateInquiries < ActiveRecord::Migration[6.0]
  def change
    create_table :inquiries do |t|
      t.string :subject
      t.string :description
      t.integer :customer_id
      t.integer :admin_id
      t.integer :status

      t.timestamps
    end
  end
end

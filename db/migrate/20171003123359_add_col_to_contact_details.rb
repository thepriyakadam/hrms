class AddColToContactDetails < ActiveRecord::Migration
  def change
    add_column :contact_details, :role6, :string
    add_column :contact_details, :role7, :string
    add_column :contact_details, :role8, :string
  end
end

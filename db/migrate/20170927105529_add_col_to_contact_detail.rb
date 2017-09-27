class AddColToContactDetail < ActiveRecord::Migration
  def change
    add_column :contact_details, :role1, :string
    add_column :contact_details, :role2, :string
    add_column :contact_details, :role3, :string
    add_column :contact_details, :role4, :string
    add_column :contact_details, :role5, :string
  end
end

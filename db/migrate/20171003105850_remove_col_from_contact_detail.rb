class RemoveColFromContactDetail < ActiveRecord::Migration
  def change
    remove_column :contact_details, :role6, :boolean
    add_column :contact_details, :role6, :string
    remove_column :contact_details, :role7, :boolean
    add_column :contact_details, :role7, :string
    remove_column :contact_details, :role8, :boolean
    add_column :contact_details, :role8, :string
  end
end

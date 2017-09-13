class AddColToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :extension_no, :string
    add_column :employees, :emergency_contact_no, :string
  end
end

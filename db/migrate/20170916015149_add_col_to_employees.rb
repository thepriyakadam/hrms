class AddColToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :optinal_contact_no1, :string
  end
end

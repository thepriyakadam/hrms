class AddColToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :extension_no, :string
  end
end

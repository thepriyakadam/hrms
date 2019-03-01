class AddColmnToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :sr_no, :string
  end
end

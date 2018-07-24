class AddColToEmployeeAteendances < ActiveRecord::Migration
  def change
    add_column :employee_attendances, :title, :string
  end
end

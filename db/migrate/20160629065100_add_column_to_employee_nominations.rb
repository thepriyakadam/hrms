class AddColumnToEmployeeNominations < ActiveRecord::Migration
  def change
  	 remove_column :employee_nominations, :phone_no, :integer
  	 add_column :employee_nominations, :phone_no, :string
  end
end

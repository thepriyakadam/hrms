class AddColToEmployeeNominations < ActiveRecord::Migration
  def change
  	 remove_column :employee_nominations, :mobile_no, :integer
  	 add_column :employee_nominations, :mobile_no, :string
  end
end

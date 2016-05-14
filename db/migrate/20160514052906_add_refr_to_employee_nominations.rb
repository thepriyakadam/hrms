class AddRefrToEmployeeNominations < ActiveRecord::Migration
  def change
  	remove_column :employee_nominations, :country, :integer
    add_reference :employee_nominations, :country, index: true, foreign_key: true
  end
end

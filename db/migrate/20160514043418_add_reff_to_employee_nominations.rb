class AddReffToEmployeeNominations < ActiveRecord::Migration
  def change
  	remove_column :employee_nominations, :relation, :integer
    add_reference :employee_nominations, :relation_master, index: true, foreign_key: true
  end
end

class AddReffToEmployeeNominations < ActiveRecord::Migration
  def change
    add_reference :employee_nominations, :relation_master, index: true, foreign_key: true
  end
end

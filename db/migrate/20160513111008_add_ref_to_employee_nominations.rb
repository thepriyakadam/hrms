class AddRefToEmployeeNominations < ActiveRecord::Migration
  def change
    add_reference :employee_nominations, :employee, index: true, foreign_key: true
  end
end

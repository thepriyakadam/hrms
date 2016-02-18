class AddRefToEmployeeManager < ActiveRecord::Migration
  def change
    add_reference :employees, :manager_2, index: true, foreign_key: true
  end
end

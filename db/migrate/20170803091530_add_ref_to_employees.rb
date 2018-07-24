class AddRefToEmployees < ActiveRecord::Migration
  def change
    # add_reference :employees, :sub_department, index: true, foreign_key: true
  end
end

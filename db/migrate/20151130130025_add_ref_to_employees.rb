class AddRefToEmployees < ActiveRecord::Migration
  def change
    add_reference :employees, :role, index: true, foreign_key: true
  end
end

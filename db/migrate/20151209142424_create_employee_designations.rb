class CreateEmployeeDesignations < ActiveRecord::Migration
  def change
    create_table :employee_designations do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

class CreateEmployeeDesignations < ActiveRecord::Migration
  def change
    create_table :employee_designations do |t|
      t.string :code
      t.string :name
      t.string :description
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end

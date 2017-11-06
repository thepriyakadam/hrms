class CreateEmployeePhysicals < ActiveRecord::Migration
  def change
    create_table :employee_physicals do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :height
      t.string :weight
      t.string :size
      t.string :trouser_size

      t.timestamps null: false
    end
  end
end

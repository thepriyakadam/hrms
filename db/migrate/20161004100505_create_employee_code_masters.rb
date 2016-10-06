class CreateEmployeeCodeMasters < ActiveRecord::Migration
  def change
    create_table :employee_code_masters do |t|
      t.string :name
      t.string :range
      t.string :last_range
      t.boolean :is_active
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end

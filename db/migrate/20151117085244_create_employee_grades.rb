class CreateEmployeeGrades < ActiveRecord::Migration
  def change
    create_table :employee_grades do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

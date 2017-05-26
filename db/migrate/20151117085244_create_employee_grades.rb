class CreateEmployeeGrades < ActiveRecord::Migration
  def change
    create_table :employee_grades do |t|
      t.string :code	
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end

class CreateEmployeePromotions < ActiveRecord::Migration
  def change
    create_table :employee_promotions do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true
      t.references :employee_designation, index: true, foreign_key: true
      t.references :employee_grade, index: true, foreign_key: true
      t.string :employee_category_id
      t.string :employee_ctc
      t.text :justification
      t.date :effective_from
      t.date :effective_to

      t.timestamps null: false
    end
  end
end

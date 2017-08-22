class CreateOtherSalaryComponents < ActiveRecord::Migration
  def change
    create_table :other_salary_components do |t|
      t.string :code
      t.string :name
      t.string :description
      t.string :is_deducted

      t.timestamps null: false
    end
  end
end

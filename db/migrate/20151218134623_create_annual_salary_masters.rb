class CreateAnnualSalaryMasters < ActiveRecord::Migration
  def change
    create_table :annual_salary_masters do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :name
      t.string :code
      t.string :description
      t.decimal :amount, :precision => 13, :scale => 2

      t.timestamps null: false
    end
  end
end

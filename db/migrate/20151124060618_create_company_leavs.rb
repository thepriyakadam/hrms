class CreateCompanyLeavs < ActiveRecord::Migration
  def change
    create_table :company_leavs do |t|
      t.references :employee_grade, index: true, foreign_key: true
      t.string :no_of_leave
      t.date :expire_date

      t.timestamps null: false
    end
  end
end

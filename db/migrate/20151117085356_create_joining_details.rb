class CreateJoiningDetails < ActiveRecord::Migration
  def change
    create_table :joining_details do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :joining_date
      t.string :designation
      t.references :employee_grade, index: true, foreign_key: true
      t.references :employee_designation, index: true, foreign_key: true
      t.date :confirmation_date
      t.string :status
      t.string :probation_period
      t.string :notice_period
      t.boolean :is_mediclaim
      t.string :medical_schem
      t.string :have_passport
      t.string :passport_no
      t.date :passport_issue_date
      t.date :passport_expiry_date

      t.timestamps null: false
    end
  end
end

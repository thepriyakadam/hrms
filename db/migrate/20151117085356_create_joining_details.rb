class CreateJoiningDetails < ActiveRecord::Migration
  def change
    create_table :joining_details do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :joining_date
      t.string :reffernce_from
      t.string :admin_hr
      t.string :tech_hr
      t.string :designation
      t.string :ctc
      t.string :account_no
      t.references :employee_grade, index: true, foreign_key: true
      t.date :confirmation_date
      t.string :status
      t.string :probation_period
      t.string :notice_period
      t.string :medical_schem

      t.timestamps null: false
    end
  end
end

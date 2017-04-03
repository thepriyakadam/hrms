class CreateJoiningDetails < ActiveRecord::Migration
  def change
    create_table :joining_details do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :joining_date
      t.references :employee_grade, index: true, foreign_key: true
      t.references :employee_designation, index: true, foreign_key: true
      t.date :confirmation_date
      t.string :status
      t.string :employee_uan_no
      t.string :employee_pf_no
      t.string :employee_efic_no
      t.string :probation_period
      t.string :notice_period
      t.boolean :is_mediclaim
      t.string :medical_schem
      t.string :have_passport
      t.string :passport_no
      t.date :passport_issue_date
      t.date :passport_expiry_date
      t.boolean :is_society_member
      t.date :retirement_date, :date
      t.references :reserved_category, index: true, foreign_key: true
      t.string :select_pf
      t.string :pf_max_amount
      t.boolean :have_esic
      t.references :cost_center, index: true, foreign_key: true
      t.references :employee_category, index: true, foreign_key: true
      t.references :payment_mode, index: true, foreign_key: true
      t.boolean :ot_option
      t.boolean :is_new,  default: true
      t.references :replacement, index: true, foreign_key: true
      t.boolean :have_retention
      t.boolean :is_employeer_pf
      t.boolean :is_employeer_esic
      t.boolean :is_insurance
      t.boolean :is_family_pension
      t.boolean :is_bonus
      t.boolean :basis_of_time,  default: false
      t.boolean :time_master
      t.boolean :time_adjusted
      t.date :leaving_date, :date
     

      t.timestamps null: false
    end
  end
end

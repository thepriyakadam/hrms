class CreateEmployeeResignations < ActiveRecord::Migration
  def change
    create_table :employee_resignations do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :resignation_date
      t.string :reason
      t.boolean :is_notice_period
      t.string :notice_period
      t.string :short_notice_period
      t.date :tentative_leaving_date
      t.text :remark
      t.date :exit_interview_date
      t.text :note
      t.date :leaving_date
      t.date :settled_on
      t.boolean :has_left
      t.boolean :notice_served
      t.boolean :rehired
      t.string :resign_status
      t.references :leaving_reason, index: true, foreign_key: true
      t.references :reporting_master, index: true, foreign_key: true
      t.boolean :is_stop_pay_request

      t.references :second_reporter
      t.references :final_reporter
      t.boolean :is_pending
      t.boolean :is_first_approved
      t.boolean :is_second_approved
      t.boolean :is_final_approved
      t.boolean :is_cancelled
      t.boolean :is_first_rejected
      t.boolean :is_second_rejected
      t.boolean :is_final_rejected
      t.datetime :application_date

      t.timestamps null: false
    end
  end
end

class CreateResignationHistories < ActiveRecord::Migration
  def change
    create_table :resignation_histories do |t|
      t.references :employee_resignation, index: true, foreign_key: true
      t.references :reporting_master, index: true, foreign_key: true
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
      t.integer :leaving_reason_id

      t.timestamps null: false
    end
  end
end

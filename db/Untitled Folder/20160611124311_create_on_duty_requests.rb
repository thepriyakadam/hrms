class CreateOnDutyRequests < ActiveRecord::Migration
  def change
    create_table :on_duty_requests do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :leave_type
      t.datetime :start_date
      t.datetime :end_date
      t.string :no_of_day
      t.text :reason 
      t.boolean :first_half
      t.boolean :last_half
      t.boolean :present_status
      t.references :first_reporter
      t.references :second_reporter
      t.integer :current_status
      t.boolean :is_pending
      t.boolean :is_cancelled
      t.boolean :is_first_approved
      t.boolean :is_second_approved
      t.boolean :is_first_rejected
      t.boolean :is_second_rejected

      t.timestamps null: false
    end
  end
end

class CreateEmployeePlans < ActiveRecord::Migration
  def change
    create_table :employee_plans do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :from_date
      t.date :to_date
      t.time :from_time
      t.time :to_time
      t.string :meeting_with
      t.string :location
      t.text :meeting_agenda
      t.boolean :confirm
      t.boolean :status
      t.string :current_status
      t.references :manager
      t.float :latitude
      t.float :longitude 
      t.integer :plan_reason_master_id
      t.text :feedback

      t.timestamps null: false
    end
  end
end

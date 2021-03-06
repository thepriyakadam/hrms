class CreateInterviewSchedules < ActiveRecord::Migration
  def change
    create_table :interview_schedules do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :selected_resume, index: true, foreign_key: true
      t.string :email_id
      t.string :candidate_name
      t.date :interview_date
      t.string :location
      t.string :post_title
      t.string :job_title
      t.boolean :is_confirm
      t.string :candidate_name2
      t.text :address
      t.boolean :is_confirmed

      t.timestamps null: false
    end
  end
end

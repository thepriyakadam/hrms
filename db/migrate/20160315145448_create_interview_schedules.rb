class CreateInterviewSchedules < ActiveRecord::Migration
  def change
    create_table :interview_schedules do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :email_id
      t.string :candidate_name
      t.date :interview_date
      t.string :location
      t.string :post_title
      t.string :job_title

      t.timestamps null: false
    end
  end
end

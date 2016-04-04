class CreateInterviewSchedules < ActiveRecord::Migration
  def change
    create_table :interview_schedules do |t|
      t.string :interviewer_name
      t.string :candidate_name
      t.date :interview_date
      t.time :interview_time
      t.string :location
      t.text :schedule_comments
      t.string :post_title
      t.string :interview_type
      t.string :interview_status

      t.timestamps null: false
    end
  end
end
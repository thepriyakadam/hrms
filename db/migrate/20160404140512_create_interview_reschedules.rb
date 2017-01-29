class CreateInterviewReschedules < ActiveRecord::Migration
  def change
    create_table :interview_reschedules do |t|
      t.date :interview_date
      t.time :interview_time

      t.timestamps null: false
    end
  end
end

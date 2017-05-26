class CreateInterviewRounds < ActiveRecord::Migration
  def change
    create_table :interview_rounds do |t|
      t.references :interview_schedule, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.references :interview_type, index: true, foreign_key: true
      t.date :interview_date
      t.time :interview_time
      t.string :location
      t.text :schedule_comment
      t.boolean :is_confirm
      t.boolean :interview_round_confirm

      t.timestamps null: false
    end
  end
end

class CreateInterviewRoundReschedules < ActiveRecord::Migration
  def change
    create_table :interview_round_reschedules do |t|
      t.references :interview_round, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.references :interview_type, index: true, foreign_key: true
      t.date :interview_date
      t.time :interview_time
      t.string :location

      t.timestamps null: false
    end
  end
end

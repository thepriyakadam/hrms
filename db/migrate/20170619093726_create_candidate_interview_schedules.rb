class CreateCandidateInterviewSchedules < ActiveRecord::Migration
  def change
    create_table :candidate_interview_schedules do |t|
      t.references :candidate_form, index: true, foreign_key: true
      t.references :interviewer
      t.references :interview_type_master, index: true, foreign_key: true
      t.date :date
      t.time :time
      t.string :place
      t.text :address
      t.text :description

      t.timestamps null: false
    end
  end
end

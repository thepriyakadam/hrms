class CreateInterviewAnalyses < ActiveRecord::Migration
  def change
    create_table :interview_analyses do |t|
      t.references :vacancy_request_history, index: true, foreign_key: true
      t.references :interview_evalution, index: true, foreign_key: true
      t.references :interview_attribute, index: true, foreign_key: true
      t.references :interview_decision, index: true, foreign_key: true
      t.references :interview_schedule, index: true, foreign_key: true
      t.references :interview_round, index: true, foreign_key: true
      t.text :comment

      t.timestamps null: false
    end
  end
end

class CreateExitInterviews < ActiveRecord::Migration
  def change
    create_table :exit_interviews do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :question_master, index: true, foreign_key: true
      t.text :answer
      t.references :employee_resignation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

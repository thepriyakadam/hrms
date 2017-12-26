class CreateSurveyDetails < ActiveRecord::Migration
  def change
    create_table :survey_details do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :survey_question, index: true, foreign_key: true
      t.references :answer_master, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

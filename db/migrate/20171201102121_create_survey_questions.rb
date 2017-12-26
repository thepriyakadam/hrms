class CreateSurveyQuestions < ActiveRecord::Migration
  def change
    create_table :survey_questions do |t|
      t.references :survey_group, index: true, foreign_key: true
      t.string :question_code
      t.string :question_category
      t.text :question
      t.boolean :status

      t.timestamps null: false
    end
  end
end

class CreateFrequestQuestions < ActiveRecord::Migration
  def change
    create_table :frequest_questions do |t|
      t.string :code
      t.text :question
      t.text :answer
      t.references :employee, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end

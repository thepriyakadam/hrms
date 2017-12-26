class CreateSurveyGroups < ActiveRecord::Migration
  def change
    create_table :survey_groups do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :name
      t.string :contact
      t.string :role
      t.boolean :status

      t.timestamps null: false
    end
  end
end

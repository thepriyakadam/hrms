class CreateTrainees < ActiveRecord::Migration
  def change
    create_table :trainees do |t|
      t.references :training_plan, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.text :feedback
      t.boolean :is_complete
      t.timestamps null: false
    end
  end
end

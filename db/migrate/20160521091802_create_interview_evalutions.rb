class CreateInterviewEvalutions < ActiveRecord::Migration
  def change
    create_table :interview_evalutions do |t|
      t.string :code
      t.string :name
      t.text :description
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end

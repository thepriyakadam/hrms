class CreateInterviewEvalutions < ActiveRecord::Migration
  def change
    create_table :interview_evalutions do |t|
      t.string :code
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end

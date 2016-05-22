class CreateInterviewDecisions < ActiveRecord::Migration
  def change
    create_table :interview_decisions do |t|
      t.string :code
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end

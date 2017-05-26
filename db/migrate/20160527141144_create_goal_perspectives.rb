class CreateGoalPerspectives < ActiveRecord::Migration
  def change
    create_table :goal_perspectives do |t|
      t.string :name
      t.boolean :goal_weightage
      t.integer :from
      t.integer :to
      t.boolean :is_confirm
      t.boolean :status

      t.timestamps null: false
    end
  end
end

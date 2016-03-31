class CreateGoalMeasures < ActiveRecord::Migration
  def change
    create_table :goal_measures do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end

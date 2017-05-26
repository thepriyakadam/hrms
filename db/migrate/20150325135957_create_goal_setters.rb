class CreateGoalSetters < ActiveRecord::Migration
  def change
    create_table :goal_setters do |t|

      t.timestamps null: false
    end
  end
end

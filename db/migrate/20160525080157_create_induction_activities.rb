class CreateInductionActivities < ActiveRecord::Migration
  def change
    create_table :induction_activities do |t|
      t.text :activity
      t.string :day
      t.integer :duration
      t.references :employee, index: true, foreign_key: true
      t.references :induction_master, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateInductionActivities < ActiveRecord::Migration
  def change
    create_table :induction_activities do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :induction_master, index: true, foreign_key: true
      t.text :activity
      t.string :day
      t.string :duration
      t.date :activity_date
      t.time :from
      t.time :to
      t.text :program_agenda
      t.date :start_date
      t.boolean :induction_completed
      t.text :facilitator_1
      t.text :facilitator_2
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end

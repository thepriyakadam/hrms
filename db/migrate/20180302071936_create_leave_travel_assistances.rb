class CreateLeaveTravelAssistances < ActiveRecord::Migration
  def change
    create_table :leave_travel_assistances do |t|
      t.references :investment_declaration, index: true, foreign_key: true
      t.date :journey_from_date
      t.date :journey_to_date
      t.string :from_location
      t.string :to_location
      t.string :person_traveled
      t.string :relationship
      t.string :travel_mode
      t.decimal :estimated_amt
      t.decimal :actual_amt
      t.decimal :total

      t.timestamps null: false
    end
  end
end

class CreateTravelRequestHistories < ActiveRecord::Migration
  def change
    create_table :travel_request_histories do |t|
      t.references :travel_request, index: true, foreign_key: true
      t.date :application_date
      t.date :traveling_date
      t.string :tour_purpose
      t.string :place
      t.decimal :traveling_advance
      t.decimal :lodging_boarding_advance
      t.decimal :food_advance
      t.decimal :extra_advance
      t.decimal :total_advance
      t.references :reporting_master, index: true, foreign_key: true
      t.string :current_status
      t.references :travel_option, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

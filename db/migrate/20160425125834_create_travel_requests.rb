class CreateTravelRequests < ActiveRecord::Migration
  def change
    create_table :travel_requests do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :reporting_manager, index: true, foreign_key: true
      t.date :application_date
      t.date :traveling_date
      t.text :tour_purpose
      t.string :place
      t.decimal :traveling_advance, precision: 15, scale: 2, default: 0
      t.decimal :lodging_boarding_advance, precision: 15, scale: 2, default: 0
      t.decimal :extra_advance, precision: 15, scale: 2, default: 0
      t.decimal :total_advance, precision: 15, scale: 2, default: 0

      t.timestamps null: false
    end
  end
end

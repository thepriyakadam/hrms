class CreateTravelRequests < ActiveRecord::Migration
  def change
    create_table :travel_requests do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :application_date
      t.date :traveling_date
      t.text :tour_purpose
      t.string :place
      t.decimal :traveling_advance, precision: 15, scale: 2, default: 0
      t.references :reporting_master, index: true, foreign_key: true
      t.string :current_status
      t.references :travel_option, index: true, foreign_key: true
      t.references :travel_mode, index: true, foreign_key: true
      t.text :daily_bill_status
      t.date :to
      t.string :day

      t.decimal :expense

      t.boolean :is_confirm

      t.text :comment

      t.timestamps null: false
    end
  end
end

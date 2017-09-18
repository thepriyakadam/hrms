class CreateTravelRequests < ActiveRecord::Migration
  def change
    create_table :travel_requests do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :application_date
      t.date :traveling_date
      t.date :to
      t.decimal :total_advance
      t.text :tour_purpose
      t.string :place
      t.string :current_status
      t.decimal :traveling_advance, precision: 15, scale: 2, default: 0
      t.references :reporting_master, index: true, foreign_key: true
      t.references :travel_option, index: true, foreign_key: true
      t.references :travel_mode, index: true, foreign_key: true
      t.string :day
      t.decimal :expense
      t.text :daily_bill_status
      t.text :comment
      t.boolean :is_confirm
      

      t.timestamps null: false
    end
  end
end

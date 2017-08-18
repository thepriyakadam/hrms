class CreateTravelRequestHistories < ActiveRecord::Migration
  def change
    create_table :travel_request_histories do |t|
      t.references :travel_request, index: true, foreign_key: true
      t.date :application_date
      t.date :traveling_date
      t.string :tour_purpose
      t.string :place
      t.decimal :total_advance
      t.references :reporting_master, index: true, foreign_key: true
      t.string :current_status
      t.references :travel_option, index: true, foreign_key: true

       t.references :travel_mode, index: true, foreign_key: true
       t.references :employee, index: true, foreign_key: true

       t.string :status
       
       t.string :daily_bill_status
      t.timestamps null: false
    end
  end
end
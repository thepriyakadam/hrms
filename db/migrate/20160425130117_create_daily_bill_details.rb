class CreateDailyBillDetails < ActiveRecord::Migration
  def change
    create_table :daily_bill_details do |t|
      t.references :travel_request, index: true, foreign_key: true
      t.date :expence_date
      t.string :e_place
      t.decimal :travel_expence, precision: 15, scale: 2, default: 0
      t.decimal :local_travel_expence, precision: 15, scale: 2, default: 0
      t.decimal :lodging_expence, precision: 15, scale: 2, default: 0
      t.decimal :boarding_expence, precision: 15, scale: 2, default: 0
      t.decimal :other_expence, precision: 15, scale: 2, default: 0

      t.timestamps null: false
    end
  end
end

class CreateDailyBillDetails < ActiveRecord::Migration
  def change
    create_table :daily_bill_details do |t|
      t.references :travel_request, index: true, foreign_key: true
      t.date :expence_date
      t.string :e_place
      t.decimal :travel_expence, precision: 15, scale: 2, default: 0
      t.references :travel_expence_type, index: true, foreign_key: true
      t.boolean :is_confirm
      t.references :reporting_master, index: true, foreign_key: true
      t.string :request_status
      
      t.references :currency_master, index: true, foreign_key: true
      t.text :remark
      t.text :remarks

      t.boolean :is_sent

      t.text :comment

      t.timestamps null: false
    end
  end
end
 
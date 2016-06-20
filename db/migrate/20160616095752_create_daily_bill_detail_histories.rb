class CreateDailyBillDetailHistories < ActiveRecord::Migration
  def change
    create_table :daily_bill_detail_histories do |t|
      t.references :daily_bill_detail, index: true, foreign_key: true
      t.references :travel_expence_type, index: true, foreign_key: true
      t.string :expence_date
      t.string :date
      t.string :e_place
      t.string :string
      t.string :travel_expence
      t.string :decimal
      t.string :is_confirm
      t.string :boolean

      t.timestamps null: false
    end
  end
end

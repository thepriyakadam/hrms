class CreateTravelExpences < ActiveRecord::Migration
  def change
    create_table :travel_expences do |t|
      t.references :travel_request, index: true, foreign_key: true
      t.decimal :total_advance_amount, precision: 15, scale: 2, default: 0
      t.decimal :total_expence_amount, precision: 15, scale: 2, default: 0
      t.decimal :remaining_amount, precision: 15, scale: 2, default: 0
      t.decimal :employee_amount, precision: 15, scale: 2, default: 0
      t.decimal :company_amount, precision: 15, scale: 2, default: 0

      t.timestamps null: false
    end
  end
end

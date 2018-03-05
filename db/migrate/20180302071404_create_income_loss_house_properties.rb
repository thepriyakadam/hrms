class CreateIncomeLossHouseProperties < ActiveRecord::Migration
  def change
    create_table :income_loss_house_properties do |t|
      t.references :investment_declaration, index: true, foreign_key: true
      t.string :property_type
      t.decimal :rental_income
      t.decimal :less_taxes
      t.decimal :less_repairs
      t.decimal :income
      t.decimal :less_interest
      t.decimal :less_pre_emi_interest
      t.decimal :estimated_total_amt
      t.decimal :actual_total_amt
      t.decimal :total

      t.timestamps null: false
    end
  end
end

class CreateInterestOnHousingLoans < ActiveRecord::Migration
  def change
    create_table :interest_on_housing_loans do |t|
      t.references :investment_declaration, index: true, foreign_key: true
      t.string :property_name
      t.text :property_address
      t.date :date_of_possession
      t.string :lender_name
      t.text :lender_address
      t.string :lender_pan_no
      t.decimal :estimated_interest
      t.decimal :actual_interest
      t.decimal :total_interest

      t.timestamps null: false
    end
  end
end

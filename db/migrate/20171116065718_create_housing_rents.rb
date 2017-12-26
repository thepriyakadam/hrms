class CreateHousingRents < ActiveRecord::Migration
  def change
    create_table :housing_rents do |t|
      t.references :investment_declaration, index: true, foreign_key: true
      t.boolean :metro_city
      t.decimal :estimated_rent
      t.decimal :actual_rent
      t.decimal :accepted_rent
      t.decimal :rejected_rent
      t.string :landlord_name
      t.string :landlord_pan_no
      t.text :address

      t.timestamps null: false
    end
  end
end

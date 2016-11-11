class CreateEmployeerInsurances < ActiveRecord::Migration
  def change
    create_table :employeer_insurances do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :insurance_date
      t.decimal :actual_amout
      t.decimal :amount

      t.timestamps null: false
    end
  end
end

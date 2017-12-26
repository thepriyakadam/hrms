class CreatePolicyDetails < ActiveRecord::Migration
  def change
    create_table :policy_details do |t|
      t.references :investment_declaration, index: true, foreign_key: true
      t.string :insurer
      t.string :policy_no
      t.string :relation
      t.string :frequency
      t.decimal :premium_amount
      t.decimal :estimated_annual_amount
      t.decimal :actual_annual_amount

      t.timestamps null: false
    end
  end
end

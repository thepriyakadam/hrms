class CreateMonthlyExpences < ActiveRecord::Migration
  def change
    create_table :monthly_expences do |t|
      t.date :expence_date
      t.decimal :amount, precision: 15, scale: 2, default: 0
      t.references :employee, index: true, foreign_key: true
      t.references :expencess_type, index: true, foreign_key: true
      t.boolean :is_paid
      t.text :description
      t.timestamps null: false
    end
  end
end

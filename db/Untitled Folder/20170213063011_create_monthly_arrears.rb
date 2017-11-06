class CreateMonthlyArrears < ActiveRecord::Migration
  def change
    create_table :monthly_arrears do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :day
      t.decimal :amount
      t.boolean :is_paid
      t.text :description

      t.timestamps null: false
    end
  end
end

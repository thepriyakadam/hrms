class CreateBonusEmployees < ActiveRecord::Migration
  def change
    create_table :bonus_employees do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :bonus_date
      t.decimal :amount, precision: 15, scale: 2

      t.timestamps null: false
    end
  end
end
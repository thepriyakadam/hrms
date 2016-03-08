class CreateBonus < ActiveRecord::Migration
  def change
    create_table :bonus do |t|
      t.references :employee, index: true, foreign_key: true
      t.decimal :bonus_amount, precision: 15, scale: 2, default: 0
      t.string :bouns_date

      t.timestamps null: false
    end
  end
end

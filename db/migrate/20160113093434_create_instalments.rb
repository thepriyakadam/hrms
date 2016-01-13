class CreateInstalments < ActiveRecord::Migration
  def change
    create_table :instalments do |t|
      t.references :advance_salary, index: true, foreign_key: true
      t.date :instalment_date
      t.decimal :instalment_amount, precision: 15, scale: 2

      t.timestamps null: false
    end
  end
end

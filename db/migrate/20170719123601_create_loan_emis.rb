class CreateLoanEmis < ActiveRecord::Migration
  def change
    create_table :loan_emis do |t|
      t.references :loan_approval, index: true, foreign_key: true
      t.date :date
      t.decimal :emi_amount,scale: 2 ,precision: 15
      t.boolean :status , default: false

      t.timestamps null: false
    end
  end
end

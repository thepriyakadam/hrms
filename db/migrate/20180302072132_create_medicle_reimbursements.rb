class CreateMedicleReimbursements < ActiveRecord::Migration
  def change
    create_table :medicle_reimbursements do |t|
      t.references :investment_declaration, index: true, foreign_key: true
      t.decimal :bill_no
      t.date :bill_date
      t.string :name_on_invoice
      t.decimal :estimated_amt
      t.decimal :actual_amt
      t.decimal :toatal_amt

      t.timestamps null: false
    end
  end
end
